Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F01274F3
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 06:12:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C09A3C2391
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 06:12:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 953D83C1CA6
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 06:12:31 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 97B6D1400967
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 06:12:27 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,334,1571673600"; d="scan'208";a="80556212"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 13:12:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 32FE54B6EC6D;
 Fri, 20 Dec 2019 13:03:37 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 20 Dec 2019 13:12:20 +0800
To: Pengfei Xu <pengfei.xu@intel.com>
References: <20191219131855.28799-1-pengfei.xu@intel.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <17da9c80-0225-7344-b8a7-0e86ee783bad@cn.fujitsu.com>
Date: Fri, 20 Dec 2019 13:12:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191219131855.28799-1-pengfei.xu@intel.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 32FE54B6EC6D.AFFB1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib/tst_kconfig.c: Add any kconfig to
 match the expected value function
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGVuZ2ZlaQoKVGhpcyBwYXRjaCBzZXQgbG9va3MgZ29vZCB0byBtZSwgb25seSBhIHNhbWxs
IGNvbW1lbnQuClJldmlld2VkLWJ5OiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3Uu
Y29tPgoKb24gMjAxOS8xMi8xOSAyMToxOCwgUGVuZ2ZlaSBYdSB3cm90ZToKPiBFeGFtcGxlOiBD
T05GSUdfWDg2X0lOVEVMX1VNSVA9eSBmb3IgdW1pcCBrY29uZmlnIGJlZm9yZSBhbmQgdjUuNAo+
ICAgICAgICAgICAgIG1haW5saW5lIGtlcm5lbC4KPiAgICAgICAgICAgQ09ORklHX1g4Nl9VTUlQ
PXkgZm9yIHVtaXAga2NvbmZpZyBhZnRlciB2NS41IG1haW5saW5lIGtlcm5lbC4KPiBGb3JtYXQ6
IENPTkZJR19YODZfSU5URUxfVU1JUHxDT05GSUdfWDg2X1VNSVA9eQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBlbmdmZWkgWHUgPHBlbmdmZWkueHVAaW50ZWwuY29tPgo+IC0tLQo+ICAgbGliL3RzdF9r
Y29uZmlnLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvbGliL3RzdF9rY29uZmlnLmMgYi9saWIvdHN0X2tjb25maWcuYwo+IGluZGV4IDRi
NTE0MTNlNS4uNzRjNDZlYmVjIDEwMDY0NAo+IC0tLSBhL2xpYi90c3Rfa2NvbmZpZy5jCj4gKysr
IGIvbGliL3RzdF9rY29uZmlnLmMKPiBAQCAtMTY3LDcgKzE2Nyw4IEBAIHZvaWQgdHN0X2tjb25m
aWdfcmVhZChjb25zdCBjaGFyICpjb25zdCAqa2NvbmZpZ3MsCj4gICAJc3RydWN0IG1hdGNoIG1h
dGNoZXNbY250XTsKPiAgIAlGSUxFICpmcDsKPiAgIAl1bnNpZ25lZCBpbnQgaSwgajsKPiAtCWNo
YXIgYnVmWzEwMjRdOwo+ICsJY2hhciBidWZbMTAyNF0sIGtjb25maWdfbXVsdGlbMTAwXTsKPiAr
CWNoYXIgKmtjb25maWdfdG9rZW4gPSBOVUxMLCAqcF9sZWZ0ID0gTlVMTDsKPiAgIAo+ICAgCWZv
ciAoaSA9IDA7IGkgPCBjbnQ7IGkrKykgewo+ICAgCQljb25zdCBjaGFyICp2YWwgPSBzdHJjaHIo
a2NvbmZpZ3NbaV0sICc9Jyk7Cj4gQEAgLTE3NiwxMiArMTc3LDkgQEAgdm9pZCB0c3Rfa2NvbmZp
Z19yZWFkKGNvbnN0IGNoYXIgKmNvbnN0ICprY29uZmlncywKPiAgIAkJCXRzdF9icmsoVEJST0ss
ICJJbnZhbGlkIGNvbmZpZyBzdHJpbmcgJyVzJyIsIGtjb25maWdzW2ldKTsKPiAgIAo+ICAgCQlt
YXRjaGVzW2ldLm1hdGNoID0gMDsKPiAtCQltYXRjaGVzW2ldLmxlbiA9IHN0cmxlbihrY29uZmln
c1tpXSk7Cj4gICAKPiAtCQlpZiAodmFsKSB7Cj4gKwkJaWYgKHZhbCkKPiAgIAkJCW1hdGNoZXNb
aV0udmFsID0gdmFsICsgMTsKPiAtCQkJbWF0Y2hlc1tpXS5sZW4gLT0gc3RybGVuKHZhbCk7Cj4g
LQkJfQo+ICAgCj4gICAJCXJlc3VsdHNbaV0ubWF0Y2ggPSAwOwo+ICAgCQlyZXN1bHRzW2ldLnZh
bHVlID0gTlVMTDsKPiBAQCAtMTkzLDE3ICsxOTEsMjkgQEAgdm9pZCB0c3Rfa2NvbmZpZ19yZWFk
KGNvbnN0IGNoYXIgKmNvbnN0ICprY29uZmlncywKPiAgIAo+ICAgCXdoaWxlIChmZ2V0cyhidWYs
IHNpemVvZihidWYpLCBmcCkpIHsKPiAgIAkJZm9yIChpID0gMDsgaSA8IGNudDsgaSsrKSB7Cj4g
LQkJCWlmIChtYXRjaCgmbWF0Y2hlc1tpXSwga2NvbmZpZ3NbaV0sICZyZXN1bHRzW2ldLCBidWYp
KSB7Cj4gLQkJCQlmb3IgKGogPSAwOyBqIDwgY250OyBqKyspIHsKPiAtCQkJCQlpZiAobWF0Y2hl
c1tqXS5tYXRjaCkKPiAtCQkJCQkJYnJlYWs7Cj4gKwkJCW1lbXNldChrY29uZmlnX211bHRpLCAw
LCBzaXplb2Yoa2NvbmZpZ19tdWx0aSkpOwo+ICsJCQkvKiBzdHJ0b2tfciB3aWxsIHNwbGl0IGtj
b25maWdzW2ldIHRvIG11bHRpIHN0cmluZywgc28gY29weSBpdCAqLwo+ICsJCQltZW1jcHkoa2Nv
bmZpZ19tdWx0aSwga2NvbmZpZ3NbaV0sIHN0cmxlbihrY29uZmlnc1tpXSkpOwo+ICsJCQlrY29u
ZmlnX3Rva2VuID0gc3RydG9rX3Ioa2NvbmZpZ19tdWx0aSwgInw9IiwgJnBfbGVmdCk7Cj4gKwo+
ICsJCQl3aGlsZSAoa2NvbmZpZ190b2tlbiAhPSBOVUxMKSB7Cj4gKwkJCQlpZiAoc3RybmNtcCgi
Q09ORklHXyIsIGtjb25maWdfdG9rZW4sIDcpKQo+ICsJCQkJCXRzdF9icmsoVEJST0ssICJJbnZh
bGlkIGNvbmZpZyBzdHJpbmcgJyVzJyIsIGtjb25maWdfdG9rZW4pOwo+ICsJCQkJbWF0Y2hlc1tp
XS5sZW4gPSBzdHJsZW4oa2NvbmZpZ190b2tlbik7Cj4gKwkJCQlpZiAobWF0Y2goJm1hdGNoZXNb
aV0sIGtjb25maWdfdG9rZW4sICZyZXN1bHRzW2ldLCBidWYpKSB7Cj4gKwkJCQkJZm9yIChqID0g
MDsgaiA8IGNudDsgaisrKSB7Cj4gKwkJCQkJCWlmIChtYXRjaGVzW2pdLm1hdGNoKQo+ICsJCQkJ
CQkJYnJlYWs7Cj4gKwkJCQkJfQo+ICAgCQkJCX0KPiAtCj4gLQkJCQlpZiAoaiA9PSBjbnQpCkl0
IHdpbGwgcmVwb3J0IKGuaqGvIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5j
dGlvbiB3aGVuIApjb21waWxlLiBCdXQgSSB0aGluayBpdCBjYW4gYmUgbW9kaWZpZWQgYnkgbWFp
bnRhaW5lciB3aGVuIGl0IGlzIG1lcmdlZC4KPiAtCQkJCQlnb3RvIGV4aXQ7Cj4gKwkJCQlrY29u
ZmlnX3Rva2VuID0gc3RydG9rX3IoTlVMTCwgInw9IiwgJnBfbGVmdCk7Cj4gKwkJCQkvKiBhdm9p
ZCB0byB1c2UgYWZ0ZXIgIj0iIHN0cmluZyAqLwo+ICsJCQkJaWYgKHN0cmxlbihwX2xlZnQpID09
IDApCj4gKwkJCQkJYnJlYWs7Cj4gICAJCQl9Cj4gKwkJCWlmIChqID09IGNudCkKPiArCQkJCWdv
dG8gZXhpdDsKPiAgIAkJfQo+IC0KPiAgIAl9Cj4gICAKPiAgIGV4aXQ6Cj4gCgoKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
