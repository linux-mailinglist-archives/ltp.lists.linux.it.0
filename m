Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550D371E0
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 12:41:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6F1939032A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 12:41:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CB4213EA9C5
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 12:41:35 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 049281001571
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 12:41:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,558,1557158400"; d="scan'208";a="66218877"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 18:41:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id AAEA74CDD0C6
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 18:41:31 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 6 Jun 2019 18:41:29 +0800
Message-ID: <5CF8EDDA.2010107@cn.fujitsu.com>
Date: Thu, 6 Jun 2019 18:41:30 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <ltp@lists.linux.it>
References: <1559817080-2991-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1559817080-2991-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: AAEA74CDD0C6.A1F00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] sysctl/sysctl02: Add new regression test for
 overflow file-max
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgYWxsCgogIFBsZWFzZSBpbmdvcmUgdGhpcyBlbWFpbC4gSSB3aWxsIHNlbmQgYSB2MiBwYXRj
aC4gOi1bIAoKVGhhbmtzLgoKPiBPbiB1cHN0cmVhbSBrZXJuZWwsIGJlZm9yZSBjb21taXRbMV0s
IHRoZSBtYXggdmFsdWUgaW4gcHJvY19nZXRfbG9uZyBiYXNlZCBvbgo+IHRoZSBudW1iZXIgb2Yg
Y2hhcnMoMjEpLiBJdCByZWplY3RzIHZhbHVlcyBzdWNoIGFzIDE4NDQ2NzQ0MDczNzA5NTUxNjE2
MCAoMjEgY2hhcnMpCj4gYnV0IGFjY2VwdHMgdmFsdWVzIHN1Y2ggYXMgMTg0NDY3NDQwNzM3MDk1
NTE2MTYgKDIwIGNoYXJzKS4gQnV0IHdlIHNob3VsZCByZWplY3QgYWxsCj4gYmVjYXVzZSBib3Ro
IGFyZSBvdmVyZmxvd3MuIEFmdGVyIHRoaXMgY29tbWl0LHRoZSBwZXJtaXR0ZWQgbWF4IHZhbHVl
IGlzIDJeNjQtMS4KPgo+IEJlZm9yZSBjb21taXRbMl0sIHdoZW4gd3JpdGluZyBlY2hvIDE4NDQ2
NzQ0MDczNzA5NTUxNjE2ID4gL3Byb2Mvc3lzL2ZzL2ZpbGUtbWF4Cj4gL3Byb2Mvc3lzL2ZzL2Zp
bGUtbWF4IHdpbGwgb3ZlcmZsb3cgYW5kIGJlIHNldCB0byAwLiAgSXQgbWF5IGNyYXNoIHRoZSBz
eXN0ZW0uIFRoaXMKPiBjb21taXQgc2V0cyB0aGUgbWF4IGFuZCBtaW4gdmFsdWUgZm9yIGZpbGUt
bWF4LiBBZnRlciB0aGlzIGNvbW1pdCx0aGUgcGVybWl0dGVkIG1heAo+IHZhbHVlIGlzIDJeNjMt
MS4KPgo+IFVuZm9ydHVuYXRlbHksIGNvbW1pdFsyXSBpbnRyb2R1Y2VkIGEgbmV3IGJ1ZyBiZWNh
dXNlIHRoZSBtaW5pbXVtIHZhbHVlIHBvaW50cyBhdAo+IHRoZSBnbG9iYWwgJ3plcm8nIHZhcmlh
YmxlIHdoaWNoIGlzIGFuIGludC4gSXQgbWF5IGNyYXNoIHN5c3RlbS4gVGhpcyBidWcgaGFzIGJl
ZW4gZml4ZWQKPiBidCBjb21taXRbM10uCj4KPiBJIHdpbGwgc2V0IDJeNjQgLDJeNjQtMSwyXjYz
IGFuZCAwIHRvIGZpbGUtbWF4IGluIGNhc2UgYW5kIHRlc3QgaXQuCj4KPiBbMV1odHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
Y29tbWl0Lz9pZD03ZjI5MjNjNGY3M2YyMWNmZDcxNGQxMmEyZDQ4ZGU4YzIxZjExY2ZlCj4gWzJd
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L2NvbW1pdC8/aWQ9MzJhNWFkOWMyMjg1MmU2YmQ5ZTc0YmRlYzU5MzRlZjlkMTQ4
MGJjNQo+IFszXWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTkwMDJiMjE0NjVmYTRkODI5ZWRmYzk0YTVh
NDQxMDA1Y2ZmYWE5NzIKPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlA
Y24uZnVqaXRzdS5jb20+Cj4gLS0tCj4gIHJ1bnRlc3QvY29tbWFuZHMgICAgICAgICAgICAgICAg
ICAgICAgfCAxICsKPiAgdGVzdGNhc2VzL2NvbW1hbmRzL3N5c2N0bC9zeXNjdGwwMS5zaCB8IDIg
Ky0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9ydW50ZXN0L2NvbW1hbmRzIGIvcnVudGVzdC9jb21tYW5kcwo+IGluZGV4
IGFjMTVlOGIyMy4uMTg3MGM0MjA5IDEwMDY0NAo+IC0tLSBhL3J1bnRlc3QvY29tbWFuZHMKPiAr
KysgYi9ydW50ZXN0L2NvbW1hbmRzCj4gQEAgLTQwLDMgKzQwLDQgQEAga2V5Y3RsMDFfc2gga2V5
Y3RsMDEuc2gKPiAgZ2RiMDFfc2ggZ2RiMDEuc2gKPiAgdW5zaGFyZTAxX3NoIHVuc2hhcmUwMS5z
aAo+ICBzeXNjdGwwMV9zaCBzeXNjdGwwMS5zaAo+ICtzeXNjdGwwMl9zaCBzeXNjdGwwMi5zaAo+
IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY29tbWFuZHMvc3lzY3RsL3N5c2N0bDAxLnNoIGIvdGVz
dGNhc2VzL2NvbW1hbmRzL3N5c2N0bC9zeXNjdGwwMS5zaAo+IGluZGV4IDc1MjJkYTUzZC4uYmY4
OWE2ZDhkIDEwMDc1NQo+IC0tLSBhL3Rlc3RjYXNlcy9jb21tYW5kcy9zeXNjdGwvc3lzY3RsMDEu
c2gKPiArKysgYi90ZXN0Y2FzZXMvY29tbWFuZHMvc3lzY3RsL3N5c2N0bDAxLnNoCj4gQEAgLTEs
NSArMSw1IEBACj4gICMhL2Jpbi9zaAo+IC0KPiArIwo+ICAjIENvcHlyaWdodCAoYykgMjAxOCBG
VUpJVFNVIExJTUlURUQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4gICMgQXV0aG9yOiBYaWFvIFlh
bmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgo+ICAjCgoKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
