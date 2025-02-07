# This file generated by `dagger_codegen`. Please DO NOT EDIT.
defmodule Dagger.Module do
  @moduledoc "A Dagger module."

  alias Dagger.Core.Client
  alias Dagger.Core.QueryBuilder, as: QB

  @derive Dagger.ID

  defstruct [:query_builder, :client]

  @type t() :: %__MODULE__{}

  @doc "Modules used by this module."
  @spec dependencies(t()) :: {:ok, [Dagger.Module.t()]} | {:error, term()}
  def dependencies(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("dependencies") |> QB.select("id")

    with {:ok, items} <- Client.execute(module.client, query_builder) do
      {:ok,
       for %{"id" => id} <- items do
         %Dagger.Module{
           query_builder:
             QB.query()
             |> QB.select("loadModuleFromID")
             |> QB.put_arg("id", id),
           client: module.client
         }
       end}
    end
  end

  @doc "The dependencies as configured by the module."
  @spec dependency_config(t()) :: {:ok, [Dagger.ModuleDependency.t()]} | {:error, term()}
  def dependency_config(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("dependencyConfig") |> QB.select("id")

    with {:ok, items} <- Client.execute(module.client, query_builder) do
      {:ok,
       for %{"id" => id} <- items do
         %Dagger.ModuleDependency{
           query_builder:
             QB.query()
             |> QB.select("loadModuleDependencyFromID")
             |> QB.put_arg("id", id),
           client: module.client
         }
       end}
    end
  end

  @doc "The doc string of the module, if any"
  @spec description(t()) :: {:ok, String.t()} | {:error, term()}
  def description(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("description")

    Client.execute(module.client, query_builder)
  end

  @doc "Enumerations served by this module."
  @spec enums(t()) :: {:ok, [Dagger.TypeDef.t()]} | {:error, term()}
  def enums(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("enums") |> QB.select("id")

    with {:ok, items} <- Client.execute(module.client, query_builder) do
      {:ok,
       for %{"id" => id} <- items do
         %Dagger.TypeDef{
           query_builder:
             QB.query()
             |> QB.select("loadTypeDefFromID")
             |> QB.put_arg("id", id),
           client: module.client
         }
       end}
    end
  end

  @doc "The generated files and directories made on top of the module source's context directory."
  @spec generated_context_diff(t()) :: Dagger.Directory.t()
  def generated_context_diff(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("generatedContextDiff")

    %Dagger.Directory{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "The module source's context plus any configuration and source files created by codegen."
  @spec generated_context_directory(t()) :: Dagger.Directory.t()
  def generated_context_directory(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("generatedContextDirectory")

    %Dagger.Directory{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "A unique identifier for this Module."
  @spec id(t()) :: {:ok, Dagger.ModuleID.t()} | {:error, term()}
  def id(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("id")

    Client.execute(module.client, query_builder)
  end

  @doc "Retrieves the module with the objects loaded via its SDK."
  @spec initialize(t()) :: Dagger.Module.t()
  def initialize(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("initialize")

    %Dagger.Module{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "Interfaces served by this module."
  @spec interfaces(t()) :: {:ok, [Dagger.TypeDef.t()]} | {:error, term()}
  def interfaces(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("interfaces") |> QB.select("id")

    with {:ok, items} <- Client.execute(module.client, query_builder) do
      {:ok,
       for %{"id" => id} <- items do
         %Dagger.TypeDef{
           query_builder:
             QB.query()
             |> QB.select("loadTypeDefFromID")
             |> QB.put_arg("id", id),
           client: module.client
         }
       end}
    end
  end

  @doc "The name of the module"
  @spec name(t()) :: {:ok, String.t()} | {:error, term()}
  def name(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("name")

    Client.execute(module.client, query_builder)
  end

  @doc "Objects served by this module."
  @spec objects(t()) :: {:ok, [Dagger.TypeDef.t()]} | {:error, term()}
  def objects(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("objects") |> QB.select("id")

    with {:ok, items} <- Client.execute(module.client, query_builder) do
      {:ok,
       for %{"id" => id} <- items do
         %Dagger.TypeDef{
           query_builder:
             QB.query()
             |> QB.select("loadTypeDefFromID")
             |> QB.put_arg("id", id),
           client: module.client
         }
       end}
    end
  end

  @doc "The container that runs the module's entrypoint. It will fail to execute if the module doesn't compile."
  @spec runtime(t()) :: Dagger.Container.t()
  def runtime(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("runtime")

    %Dagger.Container{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "The SDK config used by this module."
  @spec sdk(t()) :: Dagger.SDKConfig.t() | nil
  def sdk(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("sdk")

    %Dagger.SDKConfig{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc """
  Serve a module's API in the current session.

  Note: this can only be called once per session. In the future, it could return a stream or service to remove the side effect.
  """
  @spec serve(t()) :: :ok | {:error, term()}
  def serve(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("serve")

    case Client.execute(module.client, query_builder) do
      {:ok, _} -> :ok
      error -> error
    end
  end

  @doc "The source for the module."
  @spec source(t()) :: Dagger.ModuleSource.t()
  def source(%__MODULE__{} = module) do
    query_builder =
      module.query_builder |> QB.select("source")

    %Dagger.ModuleSource{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "Retrieves the module with the given description"
  @spec with_description(t(), String.t()) :: Dagger.Module.t()
  def with_description(%__MODULE__{} = module, description) do
    query_builder =
      module.query_builder
      |> QB.select("withDescription")
      |> QB.put_arg("description", description)

    %Dagger.Module{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "This module plus the given Enum type and associated values"
  @spec with_enum(t(), Dagger.TypeDef.t()) :: Dagger.Module.t()
  def with_enum(%__MODULE__{} = module, enum) do
    query_builder =
      module.query_builder |> QB.select("withEnum") |> QB.put_arg("enum", Dagger.ID.id!(enum))

    %Dagger.Module{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "This module plus the given Interface type and associated functions"
  @spec with_interface(t(), Dagger.TypeDef.t()) :: Dagger.Module.t()
  def with_interface(%__MODULE__{} = module, iface) do
    query_builder =
      module.query_builder
      |> QB.select("withInterface")
      |> QB.put_arg("iface", Dagger.ID.id!(iface))

    %Dagger.Module{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "This module plus the given Object type and associated functions."
  @spec with_object(t(), Dagger.TypeDef.t()) :: Dagger.Module.t()
  def with_object(%__MODULE__{} = module, object) do
    query_builder =
      module.query_builder
      |> QB.select("withObject")
      |> QB.put_arg("object", Dagger.ID.id!(object))

    %Dagger.Module{
      query_builder: query_builder,
      client: module.client
    }
  end

  @doc "Retrieves the module with basic configuration loaded if present."
  @spec with_source(t(), Dagger.ModuleSource.t(), [{:engine_version, String.t() | nil}]) ::
          Dagger.Module.t()
  def with_source(%__MODULE__{} = module, source, optional_args \\ []) do
    query_builder =
      module.query_builder
      |> QB.select("withSource")
      |> QB.put_arg("source", Dagger.ID.id!(source))
      |> QB.maybe_put_arg("engineVersion", optional_args[:engine_version])

    %Dagger.Module{
      query_builder: query_builder,
      client: module.client
    }
  end
end
