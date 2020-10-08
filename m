Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D172287544
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Oct 2020 15:34:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34FBB3C5929
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Oct 2020 15:34:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CCEE23C255C
 for <ltp@lists.linux.it>; Thu,  8 Oct 2020 15:34:05 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5653C600ACA
 for <ltp@lists.linux.it>; Thu,  8 Oct 2020 15:34:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,350,1596470400"; d="scan'208";a="99976264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Oct 2020 21:33:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 9D17248990C1
 for <ltp@lists.linux.it>; Thu,  8 Oct 2020 21:33:56 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Oct 2020 21:33:55 +0800
Message-ID: <5F7F1542.4040900@cn.fujitsu.com>
Date: Thu, 8 Oct 2020 21:33:54 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20200928061347.275858-1-yangx.jy@cn.fujitsu.com>
In-Reply-To: <20200928061347.275858-1-yangx.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9D17248990C1.A6B69
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/libcpuset.c: Add 'cpuset' prefix for
 cpuset files
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGmjrAoKUGluZyA6LSkKSSB0aGluayBpdCBpcyBhIHNpbXBsZSBmaXguCgpCZXN0IFJlZ2FyZHMs
ClhpYW8gWWFuZwpPbiAyMDIwLzkvMjggMTQ6MTMsIFhpYW8gWWFuZyB3cm90ZToKPiBjcHVzZXRf
Y3B1c2V0b2ZwaWQoKSBpbiBjcHVzZXRfY3B1X2hvZy5jIGNhbm5vdCBmaW5kIGNwdXNldCBmaWxl
cyBieQo+IHdyb25nIG5hbWVzKHdpdGhvdXQgJ2NwdXNldCcgcHJlZml4KSBzbyBjcHVzZXRfbG9h
ZF9iYWxhbmNlX3Rlc3Quc2gKPiByZXBvcnRlZCB0aGUgZm9sbG93aW5nIGVycm9yOgo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IGNwdXNldF9sb2FkX2JhbGFuY2Ug
MSBURkFJTDogbG9hZCBiYWxhbmNlIHRlc3QgZmFpbGVkLgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gVXNlIGNvcnJlY3QgbmFtZXMod2l0aCAnY3B1c2V0JyBw
cmVmaXgpIHRvIGZpbmQgY3B1c2V0IGZpbGVzLgo+Cj4gRml4ZXM6ICM2OTAKPiBTaWduZWQtb2Zm
LWJ5OiBYaWFvIFlhbmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgo+IC0tLQo+ICAuLi4vY29u
dHJvbGxlcnMvY3B1c2V0L2NwdXNldF9saWIvbGliY3B1c2V0LmMgfCAzNiArKysrKysrKystLS0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdXNldC9j
cHVzZXRfbGliL2xpYmNwdXNldC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jcHVz
ZXQvY3B1c2V0X2xpYi9saWJjcHVzZXQuYwo+IGluZGV4IDE3MmUyMzcxNC4uYTY4N2FkMmVlIDEw
MDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9s
aWIvbGliY3B1c2V0LmMKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdXNl
dC9jcHVzZXRfbGliL2xpYmNwdXNldC5jCj4gQEAgLTIwOTMsMTEgKzIwOTMsMTEgQEAgaW50IGNw
dXNldF9xdWVyeShzdHJ1Y3QgY3B1c2V0ICpjcCwgY29uc3QgY2hhciAqcmVscGF0aCkKPiAgCj4g
IAlmdWxscGF0aChidWYsIHNpemVvZihidWYpLCByZWxwYXRoKTsKPiAgCj4gLQlpZiAobG9hZF9m
bGFnKGJ1ZiwgJmNwLT5jcHVfZXhjbHVzaXZlLCAiY3B1X2V4Y2x1c2l2ZSIpIDwgMCkKPiArCWlm
IChsb2FkX2ZsYWcoYnVmLCAmY3AtPmNwdV9leGNsdXNpdmUsICJjcHVzZXQuY3B1X2V4Y2x1c2l2
ZSIpIDwgMCkKPiAgCQlnb3RvIGVycjsKPiAgCWNwLT5jcHVfZXhjbHVzaXZlX3ZhbGlkID0gMTsK
PiAgCj4gLQlpZiAobG9hZF9mbGFnKGJ1ZiwgJmNwLT5tZW1fZXhjbHVzaXZlLCAibWVtX2V4Y2x1
c2l2ZSIpIDwgMCkKPiArCWlmIChsb2FkX2ZsYWcoYnVmLCAmY3AtPm1lbV9leGNsdXNpdmUsICJj
cHVzZXQubWVtX2V4Y2x1c2l2ZSIpIDwgMCkKPiAgCQlnb3RvIGVycjsKPiAgCWNwLT5tZW1fZXhj
bHVzaXZlX3ZhbGlkID0gMTsKPiAgCj4gQEAgLTIxMDUsNjAgKzIxMDUsNjAgQEAgaW50IGNwdXNl
dF9xdWVyeShzdHJ1Y3QgY3B1c2V0ICpjcCwgY29uc3QgY2hhciAqcmVscGF0aCkKPiAgCQlnb3Rv
IGVycjsKPiAgCWNwLT5ub3RpZnlfb25fcmVsZWFzZV92YWxpZCA9IDE7Cj4gIAo+IC0JaWYgKGV4
aXN0c19mbGFnKGJ1ZiwgIm1lbW9yeV9taWdyYXRlIikpIHsKPiAtCQlpZiAobG9hZF9mbGFnKGJ1
ZiwgJmNwLT5tZW1vcnlfbWlncmF0ZSwgIm1lbW9yeV9taWdyYXRlIikgPCAwKQo+ICsJaWYgKGV4
aXN0c19mbGFnKGJ1ZiwgImNwdXNldC5tZW1vcnlfbWlncmF0ZSIpKSB7Cj4gKwkJaWYgKGxvYWRf
ZmxhZyhidWYsICZjcC0+bWVtb3J5X21pZ3JhdGUsICJjcHVzZXQubWVtb3J5X21pZ3JhdGUiKSA8
IDApCj4gIAkJCWdvdG8gZXJyOwo+ICAJCWNwLT5tZW1vcnlfbWlncmF0ZV92YWxpZCA9IDE7Cj4g
IAl9Cj4gIAo+IC0JaWYgKGV4aXN0c19mbGFnKGJ1ZiwgIm1lbV9oYXJkd2FsbCIpKSB7Cj4gLQkJ
aWYgKGxvYWRfZmxhZyhidWYsICZjcC0+bWVtX2hhcmR3YWxsLCAibWVtX2hhcmR3YWxsIikgPCAw
KQo+ICsJaWYgKGV4aXN0c19mbGFnKGJ1ZiwgImNwdXNldC5tZW1faGFyZHdhbGwiKSkgewo+ICsJ
CWlmIChsb2FkX2ZsYWcoYnVmLCAmY3AtPm1lbV9oYXJkd2FsbCwgImNwdXNldC5tZW1faGFyZHdh
bGwiKSA8IDApCj4gIAkJCWdvdG8gZXJyOwo+ICAJCWNwLT5tZW1faGFyZHdhbGxfdmFsaWQgPSAx
Owo+ICAJfQo+ICAKPiAtCWlmIChleGlzdHNfZmxhZyhidWYsICJtZW1vcnlfcHJlc3N1cmVfZW5h
YmxlZCIpKSB7Cj4gKwlpZiAoZXhpc3RzX2ZsYWcoYnVmLCAiY3B1c2V0Lm1lbW9yeV9wcmVzc3Vy
ZV9lbmFibGVkIikpIHsKPiAgCQlpZiAobG9hZF9mbGFnCj4gIAkJICAgIChidWYsICZjcC0+bWVt
b3J5X3ByZXNzdXJlX2VuYWJsZWQsCj4gLQkJICAgICAibWVtb3J5X3ByZXNzdXJlX2VuYWJsZWQi
KSA8IDApCj4gKwkJICAgICAiY3B1c2V0Lm1lbW9yeV9wcmVzc3VyZV9lbmFibGVkIikgPCAwKQo+
ICAJCQlnb3RvIGVycjsKPiAgCQljcC0+bWVtb3J5X3ByZXNzdXJlX2VuYWJsZWRfdmFsaWQgPSAx
Owo+ICAJfQo+ICAKPiAtCWlmIChleGlzdHNfZmxhZyhidWYsICJtZW1vcnlfc3ByZWFkX3BhZ2Ui
KSkgewo+ICsJaWYgKGV4aXN0c19mbGFnKGJ1ZiwgImNwdXNldC5tZW1vcnlfc3ByZWFkX3BhZ2Ui
KSkgewo+ICAJCWlmIChsb2FkX2ZsYWcKPiAtCQkgICAgKGJ1ZiwgJmNwLT5tZW1vcnlfc3ByZWFk
X3BhZ2UsICJtZW1vcnlfc3ByZWFkX3BhZ2UiKSA8IDApCj4gKwkJICAgIChidWYsICZjcC0+bWVt
b3J5X3NwcmVhZF9wYWdlLCAiY3B1c2V0Lm1lbW9yeV9zcHJlYWRfcGFnZSIpIDwgMCkKPiAgCQkJ
Z290byBlcnI7Cj4gIAkJY3AtPm1lbW9yeV9zcHJlYWRfcGFnZV92YWxpZCA9IDE7Cj4gIAl9Cj4g
IAo+IC0JaWYgKGV4aXN0c19mbGFnKGJ1ZiwgIm1lbW9yeV9zcHJlYWRfc2xhYiIpKSB7Cj4gKwlp
ZiAoZXhpc3RzX2ZsYWcoYnVmLCAiY3B1c2V0Lm1lbW9yeV9zcHJlYWRfc2xhYiIpKSB7Cj4gIAkJ
aWYgKGxvYWRfZmxhZwo+IC0JCSAgICAoYnVmLCAmY3AtPm1lbW9yeV9zcHJlYWRfc2xhYiwgIm1l
bW9yeV9zcHJlYWRfc2xhYiIpIDwgMCkKPiArCQkgICAgKGJ1ZiwgJmNwLT5tZW1vcnlfc3ByZWFk
X3NsYWIsICJjcHVzZXQubWVtb3J5X3NwcmVhZF9zbGFiIikgPCAwKQo+ICAJCQlnb3RvIGVycjsK
PiAgCQljcC0+bWVtb3J5X3NwcmVhZF9zbGFiX3ZhbGlkID0gMTsKPiAgCX0KPiAgCj4gLQlpZiAo
ZXhpc3RzX2ZsYWcoYnVmLCAic2NoZWRfbG9hZF9iYWxhbmNlIikpIHsKPiArCWlmIChleGlzdHNf
ZmxhZyhidWYsICJjcHVzZXQuc2NoZWRfbG9hZF9iYWxhbmNlIikpIHsKPiAgCQlpZiAobG9hZF9m
bGFnCj4gLQkJICAgIChidWYsICZjcC0+c2NoZWRfbG9hZF9iYWxhbmNlLCAic2NoZWRfbG9hZF9i
YWxhbmNlIikgPCAwKQo+ICsJCSAgICAoYnVmLCAmY3AtPnNjaGVkX2xvYWRfYmFsYW5jZSwgImNw
dXNldC5zY2hlZF9sb2FkX2JhbGFuY2UiKSA8IDApCj4gIAkJCWdvdG8gZXJyOwo+ICAJCWNwLT5z
Y2hlZF9sb2FkX2JhbGFuY2VfdmFsaWQgPSAxOwo+ICAJfQo+ICAKPiAtCWlmIChleGlzdHNfZmxh
ZyhidWYsICJzY2hlZF9yZWxheF9kb21haW5fbGV2ZWwiKSkgewo+ICsJaWYgKGV4aXN0c19mbGFn
KGJ1ZiwgImNwdXNldC5zY2hlZF9yZWxheF9kb21haW5fbGV2ZWwiKSkgewo+ICAJCWlmIChsb2Fk
X251bWJlcgo+ICAJCSAgICAoYnVmLCAmY3AtPnNjaGVkX3JlbGF4X2RvbWFpbl9sZXZlbCwKPiAt
CQkgICAgICJzY2hlZF9yZWxheF9kb21haW5fbGV2ZWwiKSA8IDApCj4gKwkJICAgICAiY3B1c2V0
LnNjaGVkX3JlbGF4X2RvbWFpbl9sZXZlbCIpIDwgMCkKPiAgCQkJZ290byBlcnI7Cj4gIAkJY3At
PnNjaGVkX3JlbGF4X2RvbWFpbl9sZXZlbF92YWxpZCA9IDE7Cj4gIAl9Cj4gIAo+IC0JaWYgKGxv
YWRfbWFzayhidWYsICZjcC0+Y3B1cywgY3B1c2V0X2NwdXNfbmJpdHMoKSwgImNwdXMiKSA8IDAp
Cj4gKwlpZiAobG9hZF9tYXNrKGJ1ZiwgJmNwLT5jcHVzLCBjcHVzZXRfY3B1c19uYml0cygpLCAi
Y3B1c2V0LmNwdXMiKSA8IDApCj4gIAkJZ290byBlcnI7Cj4gIAljcC0+Y3B1c192YWxpZCA9IDE7
Cj4gIAo+IC0JaWYgKGxvYWRfbWFzayhidWYsICZjcC0+bWVtcywgY3B1c2V0X21lbXNfbmJpdHMo
KSwgIm1lbXMiKSA8IDApCj4gKwlpZiAobG9hZF9tYXNrKGJ1ZiwgJmNwLT5tZW1zLCBjcHVzZXRf
bWVtc19uYml0cygpLCAiY3B1c2V0Lm1lbXMiKSA8IDApCj4gIAkJZ290byBlcnI7Cj4gIAljcC0+
bWVtc192YWxpZCA9IDE7Cj4gIAoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
