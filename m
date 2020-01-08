Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEF13398B
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 04:19:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D880E3C2591
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 04:19:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8A28B3C246A
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 04:19:22 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E0ED01400548
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 04:19:20 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,408,1571673600"; d="scan'208";a="81467830"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Jan 2020 11:19:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A01C6406AB15;
 Wed,  8 Jan 2020 11:10:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 8 Jan 2020 11:19:15 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1576577571-3668-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200107133913.GE26408@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <e6cada30-fb4e-a2e0-72e9-cdfc796361cb@cn.fujitsu.com>
Date: Wed, 8 Jan 2020 11:19:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200107133913.GE26408@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A01C6406AB15.ABA19
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/capset03: add new EPERM error
 test without CAP_SETPCAP
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkKPiBIaSEKPj4gK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4+ICt7Cj4+ICsJcGlkX3QgcGlk
Owo+PiArCj4+ICsJcGlkID0gZ2V0cGlkKCk7Cj4+ICsJaGVhZGVyLnBpZCA9IHBpZDsKPj4gKwlp
ZiAoZ2V0ZXVpZCgpID09IDApIHsKPj4gKwkJVEVTVCh0c3Rfc3lzY2FsbChfX05SX2NhcHNldCwg
JmhlYWRlciwgZGF0YSkpOwo+PiArCQlpZiAoVFNUX1JFVCA9PSAtMSkKPj4gKwkJCXRzdF9icmso
VEJST0sgfCBUVEVSUk5PLCAiY2Fwc2V0IGRhdGEgZmFpbGVkIik7Cj4+ICsJfQo+IAo+IFBsZWFz
ZSBkb24ndCBkbyB0aGF0LiBJZiB0ZXN0cyBuZWVkcyByb290IChldmVuIGZvciBhIHN1YnNldCBv
ZiB0aGUKPiB0ZXN0KSBqdXN0IHNldCB0aGUgLm5lZWRzX3Jvb3QgZmxhZy4KPiAKVGhpcyB0ZXN0
IGRvZXNuJ3QgbmVlZCByb290LiBUaGVzZSBjb2RlIGlzIGRlc2lnbmVkIHRvIGNyZWF0ZSBhIApl
bnZyaW9ubWVudCBmb3Igcm9vdCB1c2VyIHRvIGdlbmVyYXRlIHRoaXMgdHlwZSBFUEVSTSAKZXJy
b3KjqG5ld19Jbmhlcml0YWJsZSBpcyBub3QgYSBzdWJzZXQgb2Ygb2xkX0luaGVyaXRhYmxlIGFu
ZCAKb2xkX1Blcm1pdHRlZCB3aXRob3V0IENBUF9TRVRQQ0FQo6kuCnJvb3QgdXNlcjoKb2xkIHBJ
OiBDQVBfS0lMTApvbGQgcFA6IENBUF9LSUxMCm5ldyBwSTogQ0FQX0tJTEwgKyBDQVBfTkVUX1JB
VwoKb3RoZXIgdXNlcjoKb2xkIHBJOiAwCm9sZCBwUDogMApuZXcgcEk6IENBUF9LSUxMICsgQ0FQ
X05FVF9SQVcKCm90aGVyIHVzZXIgYWxzbyBtZXQgY29uZGl0aW9uIGFuZCBjYW4gZ2VuZXJhdGUg
dGhpcyBFUEVSTSBlcnJvci4KCnBzOiBJbiBjYXBzZXQwMywgZ2V0cGlkKCkgaXMgdXNlbGVzcywg
d2UgY2FuIHVzZSBwaWQgPSAwIHRvIHJlcGxhY2UuCkFsc28sIGlmIHdlIGNhbiB1c2UgcGlkID0w
IGluIGVycm9yIHRlc3QsIG1heWJlIHdlIGRvbid0IG5lZWQgdG8gdGVzdCAKcGlkID0wIGluIGNh
cGdldDAxL2NhcHNldDAxLmMgLiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBpdD8KPj4gK30KPj4g
Kwo+PiArc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+PiArCS5zZXR1cCA9IHNldHVw
LAo+PiArCS50ZXN0X2FsbCA9IHZlcmlmeV9jYXBzZXQsCj4+ICsJLmNhcHMgPSAoc3RydWN0IHRz
dF9jYXAgW10pIHsKPj4gKwkJVFNUX0NBUChUU1RfQ0FQX0RST1AsIENBUF9TRVRQQ0FQKSwKPj4g
KwkJe30KPj4gKwl9LAo+PiArfTsKPj4gLS0gCj4+IDIuMTguMAo+Pgo+Pgo+Pgo+Pgo+PiAtLSAK
Pj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cj4gCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
