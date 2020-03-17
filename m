Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F01877F9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 04:06:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFD163C56A0
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 04:06:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2201C3C2233
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 04:06:34 +0100 (CET)
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9D1F8600A4F
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 04:06:32 +0100 (CET)
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id CAF76F57F3FADDCB4FA0;
 Tue, 17 Mar 2020 11:06:20 +0800 (CST)
Received: from DGGEML524-MBX.china.huawei.com ([169.254.1.203]) by
 dggeml406-hub.china.huawei.com ([10.3.17.50]) with mapi id 14.03.0487.000;
 Tue, 17 Mar 2020 11:06:16 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thread-Topic: [LTP] [PATCH] pthread_cond_init/s-c.c: Add the lose ifndef line
Thread-Index: AQHV+0vCrWYylWMsrUmiDkdV3UZziahLhRIAgACPR2A=
Date: Tue, 17 Mar 2020 03:06:15 +0000
Message-ID: <C3CD0DF8AD11A84CB25A1426DE537C61E590FAF6@dggeml524-mbx.china.huawei.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
 <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
 <b9c6b8c9-987b-fc71-4a5c-0844ea63d7ff@cn.fujitsu.com>
In-Reply-To: <b9c6b8c9-987b-fc71-4a5c-0844ea63d7ff@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.144]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] =?utf-8?b?562U5aSNOiAgW1BBVENIXSBwdGhyZWFkX2NvbmRfaW5pdC9z?=
 =?utf-8?q?-c=2Ec=3A_Add_the_lose_ifndef_line?=
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWHUNCg0KVGhhbmtzIGZvciB5b3VyIGFuc3dlcnMgYW5kIHJldmlld3MuIA0KDQpXaGVuIEkg
dXNlZCB0aGUgb3Blbi1wb3NpeCB0ZXN0c3VpdGUsIEkgbW9kaWZpZWQgbXVsdGlwbGUgZmlsZXMg
YmVmb3JlIGNvbXBpbGluZyBzdWNjZXNzZnVsbHkuIA0KDQpJdCBpcyBob3BlZCB0aGF0IGluIGZ1
dHVyZSBMVFAgcmVsZWFzZSB2ZXJzaW9ucywgb3Blbi1wb3NpeCBjYW4gYmUgYXV0b21hdGljYWxs
eSBlbmFibGVkIGFuZCBjYW4gYmUgc3VjY2Vzc2Z1bGx5IGNvbXBpbGVkIHdpdGhvdXQgbW9kaWZp
Y2F0aW9uLg0KDQpCVFcsIFRoZSBmaWxlcyBJIG1vZGlmaWVkIGFyZSBhcyBmb2xsb3dzOg0KbHRw
L3Rlc3RjYXNlcy9NYWtlZmlsZQ0KQEAgLTMwLDkgKzMwLDkgQEAgaW5jbHVkZSAkKHRvcF9zcmNk
aXIpL2luY2x1ZGUvbWsvZW52X3ByZS5taw0KICMgICAgcnVuKS4NCiBGSUxURVJfT1VUX0RJUlMg
ICAgICAgICAgICAgICAgOj0ga2R1bXANCg0KLWlmbmVxICgkKFdJVEhfT1BFTl9QT1NJWF9URVNU
U1VJVEUpLHllcykNCi1GSUxURVJfT1VUX0RJUlMgICAgICAgICAgICAgICAgKz0gb3Blbl9wb3Np
eF90ZXN0c3VpdGUNCi1lbmRpZg0KDQogaWZuZXEgKCQoV0lUSF9SRUFMVElNRV9URVNUU1VJVEUp
LHllcykNCiBGSUxURVJfT1VUX0RJUlMgICAgICAgICAgICAgICAgKz0gcmVhbHRpbWUNCg0KbHRw
L3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9MREZMQUdTDQpAQCAtMCwwICsxIEBADQor
LWxwdGhyZWFkIC1scnQgLWxtDQoNCmx0cC90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUv
ZnVuY3Rpb25hbC9NYWtlZmlsZQ0KQEAgLTUsNyArNSw3IEBADQogIw0KIA0KIGFsbCBjbGVhbiBp
bnN0YWxsIHRlc3Q6DQotCUBmb3IgZGlyIGluIGBscyAtZCAqL01ha2VmaWxlIDI+L2Rldi9udWxs
IHwgc2VkIC1lICdzLC9NYWtlZmlsZSQkLCxnJ2A7IGRvIFwNCisJQGZvciBkaXIgaW4gYGZpbmQg
LiAtbmFtZSAqTWFrZWZpbGUgfCBlZ3JlcCAtdiAnXi4vTWFrZWZpbGUnIHwgc2VkIC1lICdzLC9N
YWtlZmlsZSQkLCxnJ2A7IGRvIFwNCiAJCSQoTUFLRSkgLUMgJCRkaXIgJEA7CQkJCQkJICAgXA0K
IAlkb25lDQogDQpsdHAvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvbG9j
YXRlLXRlc3QNCkBAIC05Miw3ICs5Miw4IEBAIHJ1bm5hYmxlKQ0KIAkjIHdhbHR6IGRvd24gdGhl
IHRvb2xzIGRpcmVjdG9yeSBhbmQgdHJ5IGFuZCBidWlsZCB0MCAod2hpY2ggZG9lc24ndA0KIAkj
IG1ha2Ugc2Vuc2UgYXMgaXQncyBhIHRvb2wsIG5vdCBhIHRlc3QpLiBCZXR0ZXIgY3JpdGVyaW9u
IG5lZWRzIHRvDQogCSMgYmUgZXN0YWJsaXNoZWQgZm9yIHRoaXMgZmlsZS4NCi0JZmluZCAiJFdI
RVJFL2NvbmZvcm1hbmNlIiAiJFdIRVJFL3N0cmVzcyIgLXR5cGUgZiAtbmFtZSAnKlswLTldLmMn
IC1vIC1uYW1lICdbMC05XSotWzAtOV0qLnNoJyB8IGdyZXAgLXYgYnVpbGRvbmx5IHwgZ3JlcCAt
diAnXi4vdG9vbHMnDQorCWZpbmQgIiRXSEVSRS9jb25mb3JtYW5jZSIgIiRXSEVSRS9zdHJlc3Mi
IC10eXBlIGYgLW5hbWUgJypbMC05YS16XS5jJyAtbyAtbmFtZSAnWzAtOV0qLVswLTldKi5zaCcg
fCBncmVwIC12IGJ1aWxkb25seSB8IGdyZXAgLXYgJ14uL3Rvb2xzJyB8IGdyZXAgLXYgJ3Rlc3Rm
cm13LmMkJw0KIAlmaW5kICIkV0hFUkUvZnVuY3Rpb25hbCIgLXR5cGUgZiAtbmFtZSAnKi5jJw0K
IAk7Ow0KIHRlc3QtdG9vbHMpDQoNCmx0cC90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUv
c3RyZXNzL01ha2VmaWxlDQpAQCAtNSw3ICs1LDcgQEANCiAjDQogDQogYWxsIGNsZWFuIGluc3Rh
bGwgdGVzdDoNCi0JQGZvciBkaXIgaW4gYGxzIC1kICovTWFrZWZpbGUgMj4vZGV2L251bGwgfCBz
ZWQgLWUgJ3MsL01ha2VmaWxlJCQsLGcnYDsgZG8gXA0KKwlAZm9yIGRpciBpbiBgZmluZCAuIC1u
YW1lICpNYWtlZmlsZSB8IGVncmVwIC12ICdeLi9NYWtlZmlsZScgfCBzZWQgLWUgJ3MsL01ha2Vm
aWxlJCQsLGcnYDsgZG8gXA0KIAkJJChNQUtFKSAtQyAkJGRpciAkQDsJCQkJCQkgIFwNCiAJZG9u
ZQ0KDQpCZXN0IFJlZ2FyZHMNClpvdSBXZWkNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7
tuS6ujogWWFuZyBYdSBbbWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb21dIA0K5Y+R
6YCB5pe26Ze0OiAyMDIw5bm0M+aciDE35pelIDEwOjA4DQrmlLbku7bkuro6IFpvdXdlaSAoU2Ft
dWVsKSA8em91X3dlaUBodWF3ZWkuY29tPg0K5oqE6YCBOiBsdHBAbGlzdHMubGludXguaXQNCuS4
u+mimDogUmU6IFtMVFBdIFtQQVRDSF0gcHRocmVhZF9jb25kX2luaXQvcy1jLmM6IEFkZCB0aGUg
bG9zZSBpZm5kZWYgbGluZQ0KDQpIaSBab3UNCg0KRXZlbiB0aGlzIGNhc2UgZG9lcyd0IGNvbXBp
bGUgb3IgcnVuIG9uIGx0cCBkZWZhdWx0IGVudnJpb25tZW50LCBJIHRoaW5rIGl0IGlzIGEgZnJh
bWV3b3JrIHByb2JsZW0gYWJvdXQgbHRwIG9wZW5wb3NpeC4gVGhpcyBmaXggaXMgb2J2aW91c2x5
IGNvcnJlY3QgYW5kIHNpbXBsZS4NCg0KUmV2aWV3ZWQtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTgu
anlAY24uZnVqaXRzdS5jb20+DQoNClNvbWVvbmUgd2hvIG1lcmdpbmcgdGhpcyBwYXRjaCBjYW4g
YWRkIGZpeGVzIHRhZy4NCg0KICBGaXhlczogMzEwYzllYjZlICgiUmVtb3ZlIGV4cGxpY2l0ICNk
ZWZpbmUncyBmb3IgYF9QT1NJWF9DX1NPVVJDRWAgYW5kDQpgX1hPUEVOX1NPVVJDRWAiKQ0KDQpC
ZXN0IFJlZ2FyZHMNCllhbmcgWHUNCg0KPiBIaSBab3UNCj4gDQo+IEl0IHdhcyBpbnRyb2R1Y2Vk
IGJ5IGNvbW1pdCAzMTBjOWViNmU2KCJSZW1vdmUgZXhwbGljaXQgI2RlZmluZSdzIGZvciANCj4g
YF9QT1NJWF9DX1NPVVJDRWAgYW5kIGBfWE9QRU5fU09VUkNFYCIpLg0KPiANCj4gSU1PLCB3ZSBj
YW4gcmVtb3ZlIHRoaXMgV0lUSE9VVF9YT1BFTiBtYWNybyBkaXJlY3RseSBiZWNhdXNlIHdlIGhh
dmUgDQo+IHNldHRlZCAtRF9QT1NJWF9DX1NPVVJDRT0yMDA4MDlMIC1EX1hPUEVOX1NPVVJDRT03
MDAgaW4gDQo+IGx0cC90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvQ0ZMQUdTLg0KPiAN
Cj4gQmVzdCBSZWdhcmRzDQo+IFlhbmcgWHUNCj4+IHB0aHJlYWRfY29uZF9pbml0L3MtYy5jIHRl
c3RjYXNlIGxvc2UgYSAjaWZuZGVmIGxpbmUsIGZpeCBpdA0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBa
b3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBab3UgV2VpIDx6
b3Vfd2VpQGh1YXdlaS5jb20+DQo+PiAtLS0NCj4+ICAgDQo+PiB0ZXN0Y2FzZXMvb3Blbl9wb3Np
eF90ZXN0c3VpdGUvc3RyZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1jLmMNCj4+IHwg
MSArDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0t
Z2l0DQo+PiBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9w
dGhyZWFkX2NvbmRfaW5pdC9zLWMNCj4+IC5jIA0KPj4gYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90
ZXN0c3VpdGUvc3RyZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1jDQo+PiAuYw0KPj4N
Cj4+IGluZGV4IDZhNWM3MGEuLjhkMTg0ODQgMTAwNjQ0DQo+PiAtLS0NCj4+IGEvdGVzdGNhc2Vz
L29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3Mt
Yw0KPj4gLmMNCj4+ICsrKyANCj4+IGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0
cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3MtYw0KPj4gLmMNCj4+IEBAIC04MCw2ICs4
MCw3IEBADQo+PiDCoCAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKirCoMKgwqAg
VGVzdCBjYXNlICAgDQo+PiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Ki8NCj4+ICAgDQo+PiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+ICoqKioqKioqKioqKioqKioqKioqKioqKi8N
Cj4+DQo+PiArI2lmbmRlZiBXSVRIT1VUX1hPUEVODQo+PiDCoCB0eXBlZGVmIHN0cnVjdCBfdGVz
dHN0cnVjdCB7DQo+PiDCoMKgwqDCoMKgIHB0aHJlYWRfY29uZF90IGNuZFsxMCAqIFNDQUxBQklM
SVRZX0ZBQ1RPUl07DQo+PiDCoMKgwqDCoMKgIHB0aHJlYWRfY29uZGF0dHJfdCBjYVs0XTsNCj4+
IC0tDQo+PiAyLjYuMg0KPj4NCj4+DQo+IA0KPiANCj4gDQoNCg0KCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
