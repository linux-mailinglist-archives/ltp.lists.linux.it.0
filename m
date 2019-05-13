Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9B1B185
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:54:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A201D294AB3
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:54:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D2E68294A36
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:54:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 11A2410006DB
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:54:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,464,1549900800"; d="scan'208";a="62718121"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2019 15:54:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id BCCD34CD7BAF;
 Mon, 13 May 2019 15:54:23 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 13 May 2019 15:54:27 +0800
Message-ID: <5CD922AD.4050006@cn.fujitsu.com>
Date: Mon, 13 May 2019 15:54:21 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190412114632.GD28648@haruka.lan>
 <1555481102-4158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1555481102-4158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1555481102-4158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: BCCD34CD7BAF.A1536
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/getcpu:Add libc sched_getcpu()
 detection &&fix compiler errors
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

b24gMjAxOS8wNC8xNyAxNDowNSwgWWFuZyBYdSB3cm90ZToKPiBzY2hlZF9nZXRjcHUoKSBpc24n
dCBkZWZpbmVkIG9uIHNvbWUgb2xkIGRpc3Ryb3MsIHNvIHdlIGNhbiBhZGQgZGVjdGlvbgo+IGFu
ZCBmaXggY29tcGlsZXIgZXJyb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx4dXlhbmcy
MDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+IC0tLQo+ICBjb25maWd1cmUuYWMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0
Y3B1L2dldGNwdTAxLmMgfCA1ICsrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZp
Z3VyZS5hYwo+IGluZGV4IGZhZDhmODM5Ni4uNTNhZDc4NGQ3IDEwMDY0NAo+IC0tLSBhL2NvbmZp
Z3VyZS5hYwo+ICsrKyBiL2NvbmZpZ3VyZS5hYwo+IEBAIC03Nyw2ICs3Nyw3IEBAIEFDX0NIRUNL
X0ZVTkNTKFsgXAo+ICAgICAgcmVhZGxpbmthdCBcCj4gICAgICByZW5hbWVhdCBcCj4gICAgICBy
ZW5hbWVhdDIgXAo+ICsgICAgc2NoZWRfZ2V0Y3B1IFwKPiAgICAgIHNpZ3BlbmRpbmcgXAo+ICAg
ICAgc3BsaWNlIFwKPiAgICAgIHN0aW1lIFwKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9nZXRjcHUvZ2V0Y3B1MDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
Z2V0Y3B1L2dldGNwdTAxLmMKPiBpbmRleCBlYjZkZWQ4YWIuLmZjYzI3M2UyOSAxMDA2NDQKPiAt
LS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldGNwdS9nZXRjcHUwMS5jCj4gKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRjcHUvZ2V0Y3B1MDEuYwo+IEBAIC0xOCwxMyAr
MTgsMTQgQEAKPiAgI2luY2x1ZGUgImxhcGkvc3lzY2FsbHMuaCIKPiAgI2luY2x1ZGUgImxhcGkv
Y3B1c2V0LmgiCj4gICNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+ICsjaW5jbHVkZSAiY29uZmlnLmgi
Cj4gIAo+ICBzdGF0aWMgaW5saW5lIGludCBnZXRfY3B1KHVuc2lnbmVkICpjcHVfaWQsCj4gIAkJ
CSAgdW5zaWduZWQgKm5vZGVfaWQgTFRQX0FUVFJJQlVURV9VTlVTRUQsCj4gIAkJCSAgdm9pZCAq
Y2FjaGVfc3RydWN0IExUUF9BVFRSSUJVVEVfVU5VU0VEKQo+ICB7Cj4gLSNpZiBkZWZpbmVkKF9f
aTM4Nl9fKQo+IC0JcmV0dXJuIHN5c2NhbGwoX19OUl9nZXRjcHUsIGNwdV9pZCwgbm9kZV9pZCwg
Y2FjaGVfc3RydWN0KTsKPiArI2lmbmRlZiBIQVZFX1NDSEVEX0dFVENQVQo+ICsJcmV0dXJuIHRz
dF9zeXNjYWxsKF9fTlJfZ2V0Y3B1LCBjcHVfaWQsIG5vZGVfaWQsIGNhY2hlX3N0cnVjdCk7Cj4g
ICNlbHNlCj4gIAkqY3B1X2lkID0gc2NoZWRfZ2V0Y3B1KCk7Cj4gICNlbmRpZgpIaSwKUGluZy4g
Oi0pCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
