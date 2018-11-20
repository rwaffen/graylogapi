describe GraylogAPI::System::Cluster, vcr: true do
  include_context 'with graylogapi'

  context 'when node' do
    subject(:response) do
      graylogapi.system.cluster.node
    end

    it 'code 200' do
      expect(response.code).to eq 200
    end

    it 'contain cluster_id' do
      expect(response.keys).to include 'cluster_id'
    end

    it 'contain node_id' do
      expect(response.keys).to include 'node_id'
    end
  end

  context 'when nodes' do
    subject(:response) do
      graylogapi.system.cluster.nodes
    end

    it 'code 200' do
      expect(response.code).to eq 200
    end

    it 'contain nodes' do
      expect(response.keys).to include 'nodes'
    end

    it 'contain count' do
      expect(response.keys).to include 'total'
    end
  end

  context 'when node_by_id' do
    subject(:response) do
      graylogapi.system.cluster.node_by_id(node['node_id'])
    end

    let(:node) { graylogapi.system.cluster.node }

    it 'code 200' do
      expect(response.code).to eq 200
    end

    it 'contain node_id' do
      expect(response['node_id']).to eq node['node_id']
    end
  end

  context 'when node_id_to_hostname' do
    subject(:response) do
      graylogapi.system.cluster.node_by_hostname(node['hostname'])
    end

    let(:node) { graylogapi.system.cluster.node }

    it 'has eq hostname' do
      expect(response['hostname']).to eq node['hostname']
    end

    it 'has eq node_id' do
      expect(response['node_id']).to eq node['node_id']
    end
  end
end
