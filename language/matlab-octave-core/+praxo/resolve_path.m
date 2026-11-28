function result = resolve_path(value)
path = strrep(value, '\', '/');
if ispc && numel(path) >= 3 && path(2) == ':' && path(3) ~= '/'
    error('praxo:policy', 'POLICY_ERROR');
end
if ~is_absolute(path)
    path = [strrep(pwd, '\', '/') '/' path];
end
result = resolve_impl(path, 0);
result = strrep(result, '\', '/');
if ispc
    result = lower(result);
end
end

function result = resolve_impl(path, depth)
path = strrep(path, '\', '/');
if depth > 40
    error('praxo:policy', 'POLICY_ERROR');
end
target = symlink_target(path);
if ~isempty(target)
    target = strrep(target, '\', '/');
    if ~is_absolute(target)
        target = [parent_path(path) '/' target];
    end
    result = resolve_impl(target, depth + 1);
    return;
end
candidate = canonical_once(path);
if ~isempty(candidate)
    result = candidate;
    return;
end
parent = parent_path(path);
if isempty(parent) || strcmp(parent, path)
    result = path;
    return;
end
if numel(path) <= numel(parent)
    result = path;
    return;
end
base = path(numel(parent) + 2:end);
resolved_parent = resolve_impl(parent, depth + 1);
if isempty(resolved_parent)
    result = path;
else
    result = [resolved_parent '/' base];
end
end

function result = canonical_once(path)
result = '';
try
    candidate = canonicalize_file_name(path);
    if ~isempty(candidate)
        result = candidate;
        return;
    end
catch
end
try
    file = javaObject('java.io.File', path);
    result = char(file.getCanonicalPath());
catch
    result = '';
end
end

function result = symlink_target(path)
result = '';
try
    link = java.nio.file.Paths.get(path);
    if java.nio.file.Files.isSymbolicLink(link)
        result = char(java.nio.file.Files.readSymbolicLink(link));
        return;
    end
catch
end
[info, err] = lstat_safe(path);
if err == 0 && isfield(info, 'mode') && bitand(info.mode, 40960) == 40960
    try
        result = readlink(path);
    catch
        result = '';
    end
end
end

function [info, err] = lstat_safe(path)
info = struct();
err = 1;
if exist('OCTAVE_VERSION', 'builtin')
    [info, err] = lstat(path);
end
end

function result = is_absolute(path)
result = ~isempty(path) && (path(1) == '/' || (numel(path) >= 3 && path(2) == ':' && path(3) == '/'));
end

function result = parent_path(path)
index = find(path == '/', 1, 'last');
if isempty(index)
    result = '';
elseif index == 1
    result = '/';
elseif index == 3 && numel(path) >= 3 && path(2) == ':'
    result = path(1:3);
else
    result = path(1:index - 1);
end
end
