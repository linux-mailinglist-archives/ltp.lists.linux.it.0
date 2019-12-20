Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CED12756D
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 06:52:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D873F3C207E
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 06:52:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 66B033C1441
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 06:52:22 +0100 (CET)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CF62010000C8
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 06:52:19 +0100 (CET)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 21:52:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,334,1571727600"; d="scan'208";a="218399426"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by orsmga006.jf.intel.com with ESMTP; 19 Dec 2019 21:52:15 -0800
Date: Fri, 20 Dec 2019 13:58:47 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191220055847.ixctyiof6zzfe7bb@xpf-desktop>
References: <20191219131855.28799-1-pengfei.xu@intel.com>
 <17da9c80-0225-7344-b8a7-0e86ee783bad@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17da9c80-0225-7344-b8a7-0e86ee783bad@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWHUsCiAgVGhhbmtzIGZvciB5b3VyIGFkdmljZSEKICBJIHdpbGwgc2VuZCB0aGUgbmV3IHBh
dGNoIHRvIHNvbHZlIHRoZSB3YXJuaW5nLgoKICBUaGFua3MhCiAgQlIuCgpPbiAyMDE5LTEyLTIw
IGF0IDEzOjEyOjE3ICswODAwLCBZYW5nIFh1IHdyb3RlOgo+IEhpIFBlbmdmZWkKPiAKPiBUaGlz
IHBhdGNoIHNldCBsb29rcyBnb29kIHRvIG1lLCBvbmx5IGEgc2FtbGwgY29tbWVudC4KPiBSZXZp
ZXdlZC1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KPiAKPiBvbiAy
MDE5LzEyLzE5IDIxOjE4LCBQZW5nZmVpIFh1IHdyb3RlOgo+ID4gRXhhbXBsZTogQ09ORklHX1g4
Nl9JTlRFTF9VTUlQPXkgZm9yIHVtaXAga2NvbmZpZyBiZWZvcmUgYW5kIHY1LjQKPiA+ICAgICAg
ICAgICAgIG1haW5saW5lIGtlcm5lbC4KPiA+ICAgICAgICAgICBDT05GSUdfWDg2X1VNSVA9eSBm
b3IgdW1pcCBrY29uZmlnIGFmdGVyIHY1LjUgbWFpbmxpbmUga2VybmVsLgo+ID4gRm9ybWF0OiBD
T05GSUdfWDg2X0lOVEVMX1VNSVB8Q09ORklHX1g4Nl9VTUlQPXkKPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogUGVuZ2ZlaSBYdSA8cGVuZ2ZlaS54dUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICAgbGli
L3RzdF9rY29uZmlnLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3RzdF9rY29uZmlnLmMgYi9saWIvdHN0X2tjb25maWcu
Ywo+ID4gaW5kZXggNGI1MTQxM2U1Li43NGM0NmViZWMgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvdHN0
X2tjb25maWcuYwo+ID4gKysrIGIvbGliL3RzdF9rY29uZmlnLmMKPiA+IEBAIC0xNjcsNyArMTY3
LDggQEAgdm9pZCB0c3Rfa2NvbmZpZ19yZWFkKGNvbnN0IGNoYXIgKmNvbnN0ICprY29uZmlncywK
PiA+ICAgCXN0cnVjdCBtYXRjaCBtYXRjaGVzW2NudF07Cj4gPiArCQkJCQkJCWJyZWFrOwo+ID4g
KwkJCQkJfQo+ID4gICAJCQkJfQo+ID4gLQo+ID4gLQkJCQlpZiAoaiA9PSBjbnQpCj4gSXQgd2ls
bCByZXBvcnQg4oCYauKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rp
b24gd2hlbiBjb21waWxlLgo+IEJ1dCBJIHRoaW5rIGl0IGNhbiBiZSBtb2RpZmllZCBieSBtYWlu
dGFpbmVyIHdoZW4gaXQgaXMgbWVyZ2VkLgo+ID4gLQkJCQkJZ290byBleGl0Owo+ID4gKwkJCQlr
Y29uZmlnX3Rva2VuID0gc3RydG9rX3IoTlVMTCwgInw9IiwgJnBfbGVmdCk7Cj4gPiArCQkJCS8q
IGF2b2lkIHRvIHVzZSBhZnRlciAiPSIgc3RyaW5nICovCj4gPiArCQkJCWlmIChzdHJsZW4ocF9s
ZWZ0KSA9PSAwKQo+ID4gKwkJCQkJYnJlYWs7Cj4gPiAgIAkJCX0KPiA+ICsJCQlpZiAoaiA9PSBj
bnQpCj4gPiArCQkJCWdvdG8gZXhpdDsKPiA+ICAgCQl9Cj4gPiAtCj4gPiAgIAl9Cj4gPiAgIGV4
aXQ6Cj4gPiAKPiAKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
