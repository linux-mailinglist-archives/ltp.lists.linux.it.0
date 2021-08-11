Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBF3E8826
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 04:46:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6DEF3C70C9
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 04:46:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 497E13C70A7
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 04:46:09 +0200 (CEST)
Received: from smtpbg506.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DFE071400540
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 04:46:05 +0200 (CEST)
X-QQ-mid: bizesmtp39t1628649959ta0boyug
Received: from [10.4.23.179] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 11 Aug 2021 10:45:58 +0800 (CST)
X-QQ-SSF: 0040000000200020B000B00A0000000
X-QQ-FEAT: oPf+tCeE8zHRXNtWssIg+FQ5yFnp/01UrMDprpNHC6+MPMSylAj4PMv/WcqOf
 k9Xh19zFZHxpYsxCSl0ZQ8JUTvF1QabBbp1pOysY2CPasKELmOBl294qdKk5m57NwbH4hCy
 jq04dGLVzGL7GtO5+hbbkXNdqZz1P70ElqV6G5vYomC5XKNoMe8A001g8g1umrdf2gr4Ub0
 Tursy3b6cqFM5QAlgCScDef2AoAe2SrTgXaVr1nKEkXbFWYt+7eOU9R9Kf9mB73X7OGqVdQ
 nlEK1ypGlRtxnU6qwiZ+/GrqDxHjuXN9sUeTWwUGB92sO6Owxniqp9n7bMaey8Gx2WG2Nxk
 GuUv+HA
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210806062456.11678-1-sujiaxun@uniontech.com>
 <YRJM9PffB27VBngU@yuki> <69afbc39-4c9d-dbab-beb2-4ff43d733818@uniontech.com>
 <YRKFBxpUwJExuMzi@yuki>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <a5a54da0-4283-9e97-261d-835e4e15de13@uniontech.com>+399C52ED10E9AFD7
Date: Wed, 11 Aug 2021 10:45:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YRKFBxpUwJExuMzi@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,
 1/6] syscalls/sysfs: Convert sysfs01 to the new API
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

CgrU2iAyMDIxLzgvMTAgz8LO5zk6NTQsIEN5cmlsIEhydWJpcyDQtLXAOgo+IEhpIQo+PiBJIGNo
ZWNrZWQgd2l0aCAiY2hlY2twYXRjaC5wbCAtZiIgYW5kIHRoZXJlIHdlcmUgbm8gZXJyb3JzIG9y
IHdhcm5pbmdzLgo+PiBJIHVzZSAiZ2l0IGFtIiB0byBhcHBseSB0aGUgcGF0Y2ggbm9ybWFsbHkg
d2l0aG91dCBhbnkgd2FybmluZy4gSG93IGRpZAo+PiB5b3UgY2hlY2sgdGhhdCB0aGVyZSBhcmUg
c3BhY2VzLgo+IAo+IEhhdmUgeW91IHVzZWQgcmVjZW50IGVub3VnaCB2ZXJzaW9uPwo+IAo+IExh
dGVzdCBrZXJuZWwgZ2l0Ogo+IAo+ICQgfi9saW51eC9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLWYg
c3lzZnMwMS5jCj4gCj4gRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCB1c2UgdGFicyB3aGVyZSBw
b3NzaWJsZQo+ICMyMDogRklMRTogc3lzZnMwMS5jOjIwOgo+ICsgICAgICAgIC8qIG9wdGlvbiAx
LCBidWYgaG9sZHMgZnMgbmFtZSAqLyQKPiAKPiBFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIHVz
ZSB0YWJzIHdoZXJlIHBvc3NpYmxlCj4gIzIxOiBGSUxFOiBzeXNmczAxLmM6MjE6Cj4gKyAgICAg
ICAgVFNUX0VYUF9QT1NJVElWRSh0c3Rfc3lzY2FsbChfX05SX3N5c2ZzLCAxLCAicHJvYyIpLCQK
PiAKPiBXQVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlcyBhdCB0aGUgc3RhcnQgb2YgYSBsaW5lCj4g
IzIxOiBGSUxFOiBzeXNmczAxLmM6MjE6Cj4gKyAgICAgICAgVFNUX0VYUF9QT1NJVElWRSh0c3Rf
c3lzY2FsbChfX05SX3N5c2ZzLCAxLCAicHJvYyIpLCQKPiAKPiBFUlJPUjogY29kZSBpbmRlbnQg
c2hvdWxkIHVzZSB0YWJzIHdoZXJlIHBvc3NpYmxlCj4gIzIyOiBGSUxFOiBzeXNmczAxLmM6MjI6
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICJzeXNmcygxLCdwcm9jJykiKTskCj4gCj4gV0FS
TklORzogcGxlYXNlLCBubyBzcGFjZXMgYXQgdGhlIHN0YXJ0IG9mIGEgbGluZQo+ICMyMjogRklM
RTogc3lzZnMwMS5jOjIyOgo+IAo+IC4uLgo+IAo+IAo+ICQgY2Qgfi9saW51eC87IGdpdCBkZXNj
cmliZQo+IAo+IHY1LjE0LXJjNS0yLWc5YTczZmEzNzVkNTgKPiAKVGhhbmsgeW91LCB0aGUga2Vy
bmVsIHZlcnNpb24gSSB1c2UgaXMgdjQuMTkuOTAuIEJ1dCBpdCBtYXkgaGF2ZSBub3RoaW5nIAp0
byBkbyB3aXRoIHRoZSB2ZXJzaW9uLiBJIG9ubHkgdXNlICJjaGVja3BhdGNoLnBsIC1mIFgucGF0
Y2giIGluc3RlYWQgb2YgCiJjaGVja3BhdGNoLnBsIC1mIHN5c2ZzMDEuYyIuIEkgaGF2ZSByZXZp
c2VkIHRoZSBjaGVjayBhZ2FpbiBhbmQgd2lsbCAKcmVzdWJtaXQuCi0tIApLaW5kIHJlZ2FyZHMs
CgpzdWppYXh1bgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
