import Foundation
import Tea
import TeaUtils
import AlibabacloudOpenApi
import AlibabaCloudOpenApiUtil
import AlibabacloudEndpointUtil

open class Client : AlibabacloudOpenApi.Client {
    public override init(_ config: AlibabacloudOpenApi.Config) throws {
        try super.init(config)
        self._signatureAlgorithm = "v2"
        self._endpointRule = "regional"
        self._endpointMap = [
            "ap-northeast-1": "xrengine-daily.aliyuncs.com",
            "ap-northeast-2-pop": "xrengine-daily.aliyuncs.com",
            "ap-south-1": "xrengine-daily.aliyuncs.com",
            "ap-southeast-1": "xrengine-daily.aliyuncs.com",
            "ap-southeast-2": "xrengine-daily.aliyuncs.com",
            "ap-southeast-3": "xrengine-daily.aliyuncs.com",
            "ap-southeast-5": "xrengine-daily.aliyuncs.com",
            "cn-beijing": "xrengine-daily.aliyuncs.com",
            "cn-beijing-finance-1": "xrengine-daily.aliyuncs.com",
            "cn-beijing-finance-pop": "xrengine-daily.aliyuncs.com",
            "cn-beijing-gov-1": "xrengine-daily.aliyuncs.com",
            "cn-beijing-nu16-b01": "xrengine-daily.aliyuncs.com",
            "cn-chengdu": "xrengine-daily.aliyuncs.com",
            "cn-edge-1": "xrengine-daily.aliyuncs.com",
            "cn-fujian": "xrengine-daily.aliyuncs.com",
            "cn-haidian-cm12-c01": "xrengine-daily.aliyuncs.com",
            "cn-hangzhou-bj-b01": "xrengine-daily.aliyuncs.com",
            "cn-hangzhou-finance": "xrengine-daily.aliyuncs.com",
            "cn-hangzhou-internal-prod-1": "xrengine-daily.aliyuncs.com",
            "cn-hangzhou-internal-test-1": "xrengine-daily.aliyuncs.com",
            "cn-hangzhou-internal-test-2": "xrengine-daily.aliyuncs.com",
            "cn-hangzhou-internal-test-3": "xrengine-daily.aliyuncs.com",
            "cn-hangzhou-test-306": "xrengine-daily.aliyuncs.com",
            "cn-hongkong": "xrengine-daily.aliyuncs.com",
            "cn-hongkong-finance-pop": "xrengine-daily.aliyuncs.com",
            "cn-huhehaote": "xrengine-daily.aliyuncs.com",
            "cn-huhehaote-nebula-1": "xrengine-daily.aliyuncs.com",
            "cn-north-2-gov-1": "xrengine-daily.aliyuncs.com",
            "cn-qingdao": "xrengine-daily.aliyuncs.com",
            "cn-qingdao-nebula": "xrengine-daily.aliyuncs.com",
            "cn-shanghai": "xrengine-daily.aliyuncs.com",
            "cn-shanghai-et15-b01": "xrengine-daily.aliyuncs.com",
            "cn-shanghai-et2-b01": "xrengine-daily.aliyuncs.com",
            "cn-shanghai-finance-1": "xrengine-daily.aliyuncs.com",
            "cn-shanghai-inner": "xrengine-daily.aliyuncs.com",
            "cn-shanghai-internal-test-1": "xrengine-daily.aliyuncs.com",
            "cn-shenzhen": "xrengine-daily.aliyuncs.com",
            "cn-shenzhen-finance-1": "xrengine-daily.aliyuncs.com",
            "cn-shenzhen-inner": "xrengine-daily.aliyuncs.com",
            "cn-shenzhen-st4-d01": "xrengine-daily.aliyuncs.com",
            "cn-shenzhen-su18-b01": "xrengine-daily.aliyuncs.com",
            "cn-wuhan": "xrengine-daily.aliyuncs.com",
            "cn-wulanchabu": "xrengine-daily.aliyuncs.com",
            "cn-yushanfang": "xrengine-daily.aliyuncs.com",
            "cn-zhangbei": "xrengine-daily.aliyuncs.com",
            "cn-zhangbei-na61-b01": "xrengine-daily.aliyuncs.com",
            "cn-zhangjiakou": "xrengine-daily.aliyuncs.com",
            "cn-zhangjiakou-na62-a01": "xrengine-daily.aliyuncs.com",
            "cn-zhengzhou-nebula-1": "xrengine-daily.aliyuncs.com",
            "eu-central-1": "xrengine-daily.aliyuncs.com",
            "eu-west-1": "xrengine-daily.aliyuncs.com",
            "eu-west-1-oxs": "xrengine-daily.aliyuncs.com",
            "me-east-1": "xrengine-daily.aliyuncs.com",
            "rus-west-1-pop": "xrengine-daily.aliyuncs.com",
            "us-east-1": "xrengine-daily.aliyuncs.com",
            "us-west-1": "xrengine-daily.aliyuncs.com"
        ]
        try checkConfig(config as! AlibabacloudOpenApi.Config)
        self._endpoint = try getEndpoint("xrengine", self._regionId ?? "", self._endpointRule ?? "", self._network ?? "", self._suffix ?? "", self._endpointMap ?? [:], self._endpoint ?? "")
    }

    public func getEndpoint(_ productId: String, _ regionId: String, _ endpointRule: String, _ network: String, _ suffix: String, _ endpointMap: [String: String], _ endpoint: String) throws -> String {
        if (!TeaUtils.Client.empty(endpoint)) {
            return endpoint as! String
        }
        if (!TeaUtils.Client.isUnset(endpointMap) && !TeaUtils.Client.empty(endpointMap[regionId as! String])) {
            return endpointMap[regionId as! String] ?? ""
        }
        return try AlibabacloudEndpointUtil.Client.getEndpointRules(productId, regionId, endpointRule, network, suffix)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getProjectDatasetWithOptions(_ request: GetProjectDatasetRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> GetProjectDatasetResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.ossKey)) {
            query["OssKey"] = request.ossKey ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetProjectDataset",
            "version": "2022-11-11",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetProjectDatasetResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getProjectDataset(_ request: GetProjectDatasetRequest) async throws -> GetProjectDatasetResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await getProjectDatasetWithOptions(request as! GetProjectDatasetRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listProjectWithOptions(_ request: ListProjectRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListProjectResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.current)) {
            body["Current"] = request.current!;
        }
        if (!TeaUtils.Client.isUnset(request.size)) {
            body["Size"] = request.size!;
        }
        if (!TeaUtils.Client.isUnset(request.status)) {
            body["Status"] = request.status ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.title)) {
            body["Title"] = request.title ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.type)) {
            body["Type"] = request.type ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListProject",
            "version": "2022-11-11",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListProjectResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listProject(_ request: ListProjectRequest) async throws -> ListProjectResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listProjectWithOptions(request as! ListProjectRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func recognizeProductRegionsWithOptions(_ request: RecognizeProductRegionsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> RecognizeProductRegionsResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.category)) {
            body["Category"] = request.category!;
        }
        if (!TeaUtils.Client.isUnset(request.imageBase64)) {
            body["ImageBase64"] = request.imageBase64 ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RecognizeProductRegions",
            "version": "2022-11-11",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "Anonymous",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RecognizeProductRegionsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func recognizeProductRegions(_ request: RecognizeProductRegionsRequest) async throws -> RecognizeProductRegionsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await recognizeProductRegionsWithOptions(request as! RecognizeProductRegionsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func searchProductsByImageWithOptions(_ tmpReq: SearchProductsByImageRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> SearchProductsByImageResponse {
        try TeaUtils.Client.validateModel(tmpReq)
        var request: SearchProductsByImageShrinkRequest = SearchProductsByImageShrinkRequest([:])
        AlibabaCloudOpenApiUtil.Client.convert(tmpReq, request)
        if (!TeaUtils.Client.isUnset(tmpReq.region)) {
            request.regionShrink = AlibabaCloudOpenApiUtil.Client.arrayToStringWithSpecifiedStyle(tmpReq.region, "Region", "json")
        }
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.category)) {
            body["Category"] = request.category!;
        }
        if (!TeaUtils.Client.isUnset(request.imageBase64)) {
            body["ImageBase64"] = request.imageBase64 ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionShrink)) {
            body["Region"] = request.regionShrink ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "SearchProductsByImage",
            "version": "2022-11-11",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "Anonymous",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(SearchProductsByImageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func searchProductsByImage(_ request: SearchProductsByImageRequest) async throws -> SearchProductsByImageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await searchProductsByImageWithOptions(request as! SearchProductsByImageRequest, runtime as! TeaUtils.RuntimeOptions)
    }
}