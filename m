Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C4128697
	for <lists+linux-ltp@lfdr.de>; Sat, 21 Dec 2019 03:14:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1529F3C2441
	for <lists+linux-ltp@lfdr.de>; Sat, 21 Dec 2019 03:14:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0187A3C2034
 for <ltp@lists.linux.it>; Sat, 21 Dec 2019 03:14:43 +0100 (CET)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AC771606B20
 for <ltp@lists.linux.it>; Sat, 21 Dec 2019 03:14:41 +0100 (CET)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 18:14:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,338,1571727600"; d="scan'208";a="241676944"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga004.fm.intel.com with ESMTP; 20 Dec 2019 18:14:37 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 20 Dec 2019 18:14:37 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 20 Dec 2019 18:14:37 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.19]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.29]) with mapi id 14.03.0439.000;
 Sat, 21 Dec 2019 10:14:34 +0800
From: "Xu, Pengfei" <pengfei.xu@intel.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thread-Topic: [LTP] [PATCH v4 4/4] lib: add any kconfig to match the
 expected value function document
Thread-Index: AQHVtm37IsF1TDij8UeVwZsWSCGEiafB/CGAgACM9ID//3lgAIAAmYIA//98wgCAAcMwqw==
Date: Sat, 21 Dec 2019 02:14:33 +0000
Message-ID: <CD7C6F33-6957-4B71-8032-ACE82C4866B5@intel.com>
References: <20191219131855.28799-1-pengfei.xu@intel.com>
 <20191219131855.28799-4-pengfei.xu@intel.com>
 <9ac02979-d8ec-4a11-7705-bb484dd79a20@cn.fujitsu.com>
 <20191220060151.nqvekuzs24yipia7@xpf-desktop>
 <5e859ac0-d009-3281-e712-fc86f7c72986@cn.fujitsu.com>
 <20191220070926.i4jknfoo6pdhersl@xpf-desktop>,
 <257bd5cb-1277-def3-f4ac-e20b15e4273d@cn.fujitsu.com>
In-Reply-To: <257bd5cb-1277-def3-f4ac-e20b15e4273d@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/4] lib: add any kconfig to match the expected
 value function document
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
Cc: "Su, Heng" <heng.su@intel.com>, "Neri, Ricardo" <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

DQoNClRoYW5rcyBYdSEgOikNCg0KQlIuDQo+IOWcqCAyMDE55bm0MTLmnIgyMOaXpe+8jDE1OjIw
77yMWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4g5YaZ6YGT77yaDQo+IA0K
PiDvu79IaSBQZW5nZmVpDQo+PiBIaSBYdSwNCj4+ICAgRHVlIHRvIG1lbW9yeSBjb3B5LCB0aGVy
ZSBpcyBzb21lIGJpdCBhbmQgZGlzcGxheSBpc3N1ZSBpbiBsYXN0IHN0cmluZy4NCj4+ICAgU28g
Zm9yIHlvdXIgcXVlc3Rpb24sIGZvciBDT05GSUdfQXxDT05GSUdfQiB3aXRob3V0IGV4cGVjdCB2
YWx1ZSwgbWF5YmUgeQ0KPj4gICBvciBtLg0KPj4gICBXZSBjb3VsZCBhZGQgaXQgd2l0aCBiZWxv
dyBzdHlsZToNCj4+ICAgIkNPTkZJR19BfENPTkZJR19CfE5BIiwgYW5kIGFkZCBpdCBpbnRvIGd1
aWRlbGluZXMsIE5BIHdpbGwgbm90IGJlIHNvbHZlZCwNCj4+ICAgYWN0dWFsbHkgeW91IGNvdWxk
IGZpbGwgd2l0aCBhbnkgc3RyaW5nIGFmdGVyIGxhc3QgJ3wnLg0KPj4gICBJcyBpdCBvaz8NCj4g
SXQgc291bmRzIHJlYXNvbmFibGUuIEkgdGhpbmsgaXQgaXMgb2suDQo+IA0KPiBLaW5kIFJlZ2Fy
ZHMNCj4gWWFuZyBYdQ0KPj4gICBUaGFua3MhDQo+Pj4gT24gMjAxOS0xMi0yMCBhdCAxNDowMDow
MCArMDgwMCwgWWFuZyBYdSB3cm90ZToNCj4+PiBIaSBQZW5nZmVpDQo+Pj4+IEhpIFh1LA0KPj4+
PiANCj4+Pj4gDQo+Pj4+PiBCZWZvcmUgeW91ciBwYXRjaCwgSSBrbm93IHdlIGNhbiB1c2UgdGhl
IGZvbGxvd2luZyB0d28gZm9ybWF0cyBrY29uZmlncw0KPj4+Pj4gQ09ORklHX0ENCj4+Pj4+IENP
TkZJR19BPXkvbS92DQo+Pj4+PiBhZnRlciB5b3VyIHBhdGNoIHNldCwgd2UgY2FuIHVzZSB0aGUg
Zm9sbG93aW5nIHRocmVlIGZvcm1hdHMga2NvbmZpZ3MNCj4+Pj4+IENPTkZJR19BDQo+Pj4+PiBD
T05GSUdfQT15L20vdg0KPj4+Pj4gQ09ORklHX0F8Q09ORklHQj15L20vdg0KPj4+Pj4gQXMgdGhl
IHVzdWFsIGV4dGVuZCBsb2dpYywgIHdlIHRoaW5rICBDT05GSUdBfENPTkZJR0IgaXMgYWxzbyBv
ay4gQnV0IGluDQo+Pj4+PiBmYWN0LCB3ZSB1c2UgInwiIG9yICI9IiB0byBkZWxpbSBzdHJpbmcu
IFNvICB3ZSBjYW4ndCBwYXJzZSBDT05GSUdBfENPTkZJR0INCj4+Pj4+IGNvcnJlY3RseS4gU28s
IGlmIHdlIGNhbiB0ZWxsIHVzZXIgb3IgZGV2ZWxvcGVyIGFib3V0IHRoaXMgaW4gaGVyZSwgaXQg
d2lsbA0KPj4+Pj4gYmUgYmV0dGVyLg0KPj4+Pj4gDQo+Pj4+PiBwczogd2UgY2FuIGFkZCBjb25m
aWdBfCBjb25maWcgQiB0ZXN0IGluIHlvdXIgdGhpcmQgcGF0Y2guDQo+Pj4+PiANCj4+Pj4gICAg
QWN0dWFsbHkgcHJlc2VudCBwYXRjaCBjb3VsZCBzdXBwb3J0IENPTkZJR19BfENPTkZJR19CIHN0
eWxlLCBhbmQgaXQgd29ya3MNCj4+Pj4gd2VsbCwgeW91IGNvdWxkIGNoYW5nZSAiQ09ORklHX1g4
Nl9JTlRFTF9VTUlQfENPTkZJR19YODZfVU1JUD15IiB0bw0KPj4+PiAiQ09ORklHX1g4Nl9JTlRF
TF9VTUlQfENPTkZJR19YODZfVU1JUCIgaW4gdGVzdF9rY29uZmlnLmMgYW5kIGhhdmUgYSB0cnku
IDogKQ0KPj4+ICJDT05GSUdfWDg2X0lOVEVMX1VNSVB8Q09ORklHX1g4Nl9VTUlQIiBpcyB1c2Vm
dWwgYmVjYXVzZQ0KPj4+IENPTkZJR19YODZfSU5URUxfVU1JUCBpcyBpbiBvdXIga2VybmVsIGNv
bmZpZ3MgLiBJZiB5b3UgdXNlDQo+Pj4gIkNPTkZJR19YODZfVU1JUHxDT05GSUdfWDg2X0lOVEVM
X1VNSVAiLCBpdCB3aWxsIHJlcG9ydCBlcnJvci4NCj4+PiANCj4+PiBLaW5kIFJlZ2FyZHMNCj4+
PiBZYW5nIFh1DQo+Pj4+IA0KPj4+PiBUaGFua3MhDQo+Pj4+PiBLaW5kIFJlZ2FyZHMNCj4+Pj4+
IFlhbmcgWHUNCj4+Pj4+PiAgICAjaW5jbHVkZSAidHN0X3Rlc3QuaCINCj4+Pj4+PiAgICBzdGF0
aWMgY29uc3QgY2hhciAqa2NvbmZpZ3NbXSA9IHsNCj4+Pj4+PiAtICAgICJDT05GSUdfWDg2X0lO
VEVMX1VNSVAiLA0KPj4+Pj4+ICsgICAgIkNPTkZJR19FWFQ0X0ZTPXkiLA0KPj4+Pj4+ICsgICAg
IkNPTkZJR19NTVUiLA0KPj4+Pj4+ICsgICAgIkNPTkZJR19YODZfSU5URUxfVU1JUHxDT05GSUdf
WDg2X1VNSVA9eSIsDQo+Pj4+Pj4gICAgICAgIE5VTEwNCj4+Pj4+PiAgICB9Ow0KPj4+Pj4+IA0K
Pj4+Pj4gDQo+Pj4+PiANCj4+Pj4gDQo+Pj4+IA0KPj4+IA0KPj4+IA0KPiANCj4gDQoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
