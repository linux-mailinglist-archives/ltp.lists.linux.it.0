Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 355AD2B4331
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 12:58:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91D803C5DA7
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 12:58:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 87D523C4F3C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 12:58:33 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 670161000A2D
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 12:58:32 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id AE7B9A07FD
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605527909; bh=ncyivu0a02B8151arqeL8C84jez/qnPAYiPi2z6Y/vE=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=VzYhlM7CbEiIxIVBFKY/nUREtg6yhK5eR8omQEylV71tmmjzr4/Jqp4SwaZqEmpgb
 CRLv/Luf7HXH5tujWmQcn2WEFSpfrUe2z91WOxf3fZCZr6mvHm7iB39Y13eJbsDc32
 sRWesqePHg2MBT6lEU1hXVocVc3fD1+v/NtXbpNo=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
References: <20191115101039.43386-1-lkml@jv-coder.de>
Message-ID: <a42725d1-1469-e71f-e28d-1eff42e3e86d@jv-coder.de>
Date: Mon, 16 Nov 2020 12:58:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20191115101039.43386-1-lkml@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] cpuset_regression_test: Fix for already existing
 cpusets
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgphIHBpbmcgZm9yIHRoaXMgcGF0Y2g/IElzIHNvbWV0aGluZyBsaWtlIHRoYXQgKHdvcmth
cm91bmQgZW52aXJvbm1lbnQgCmlzc3Vlcykgbm90IHdhbnRlZCBpbiBsdHA/CgpHcmVldHMKSsO2
cmcKCk9uIDExLzE1LzIwMTkgMTE6MTAgQU0sIEpvZXJnIFZlaGxvdyB3cm90ZToKPiBGcm9tOiBK
b2VyZyBWZWhsb3cgPGpvZXJnLnZlaGxvd0Bhb3gtdGVjaC5kZT4KPgo+IElmIHRoZXJlIGFyZSBh
bHJlYWR5IGNwdXNldHMgZGVmaW5lZCBvbiB0aGUgc3lzdGVtLCB0aGF0IHVzZSBjcHUgMC0xLAo+
IHRoZSB0ZXN0IGZhaWxzLCBiZWNhdXNlIGl0IHRyaWVzIHRvIGV4Y2x1c2l2ZWx5IHVzZSBjcHUg
MC0xIGZvciB0aGUKPiB0ZXN0Y2FzZS4KPgo+IFRoZSBmaXggc2V0cyB0aGUgY3B1c2V0IGZvciBh
bGwgY2dyb3VwcyB0byAwIGFuZCBkaXNhYmxlcyBleGNsdXNpdmUKPiBjcHUgdXNhZ2UgZm9yIHRo
ZSBkdXJhdGlvbiBvZiB0aGUgdGVzdCBhbmQgcmVzdG9yZXMgaXQgb24gY2xlYW51cC4KPiBGb3Ig
dGhlIHRlc3Qgb25seSBjcHUgMSBpcyBzZXQgYXMgZXhjbHVzaXZlLiBUaGlzIGlzIGVub3VnaCB0
bwo+IHRyaWdnZXIgdGhlIGJ1ZyB0aGlzIHJlZ3Jlc3Npb24gdGVzdCB3YXMgZGVzaWduZWQgZm9y
Lgo+IFRoaXMgd2FzIHRlc3RlZCBieSByZXZlcnRpbmcgdGhlIGNvbW1pdCBtZW50aW9uZWQgaW4g
dGhlIHRlc3RjYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9lcmcgVmVobG93IDxqb2VyZy52ZWhs
b3dAYW94LXRlY2guZGU+Cj4gLS0tCj4gICAuLi4vY3B1c2V0L2NwdXNldF9yZWdyZXNzaW9uX3Rl
c3Quc2ggICAgICAgICAgfCA1OCArKysrKysrKysrKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdXNldC9jcHVzZXRfcmVncmVzc2lvbl90ZXN0LnNo
IGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jcHVzZXQvY3B1c2V0X3JlZ3Jlc3Npb25f
dGVzdC5zaAo+IGluZGV4IGRjY2ZkOTFjZC4uZWQ1ZTMwZjJhIDEwMDc1NQo+IC0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9yZWdyZXNzaW9uX3Rlc3Quc2gK
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdXNldC9jcHVzZXRfcmVncmVz
c2lvbl90ZXN0LnNoCj4gQEAgLTI2LDYgKzI2LDQ5IEBAIFRDSUQ9Y3B1c2V0X3JlZ3Jlc3Npb25f
dGVzdAo+ICAgVFNUX1RPVEFMPTEKPiAgIC4gdGVzdC5zaAo+ICAgCj4gKyMgY3B1c2V0X2JhY2t1
cF9hbmRfdXBkYXRlIDxiYWNrdXBfZGlyPiA8d2hhdD4gPHZhbHVlPgo+ICsjIENyZWF0ZSBiYWNr
dXAgb2YgdGhlIHZhbHVlcyBvZiBhIHNwZWNpZmljIGZpbGUgKDx3aGF0PikKPiArIyBpbiBhbGwg
Y3B1c2V0IGdyb3VwcyBhbmQgc2V0IHRoZSB2YWx1ZSB0byA8dmFsdWU+Cj4gKyMgVGhlIGJhY2t1
cCBpcyB3cml0dGVuIHRvIDxiYWNrdXBfZGlyPiBpbiB0aGUgc2FtZSBzdHJ1Y3R1cmUKPiArIyBh
cyBpbiB0aGUgY3B1c2V0IGZpbGVzeXN0ZW0KPiArY3B1c2V0X2JhY2t1cF9hbmRfdXBkYXRlKCkK
PiArewo+ICsJbG9jYWwgYmFja3VwX2Rpcj0kMQo+ICsJbG9jYWwgd2hhdD0kMgo+ICsJbG9jYWwg
dmFsdWU9JDMKPiArCWxvY2FsIG9sZF9kaXI9JChwd2QpCj4gKwo+ICsJY2QgJHtyb290X2NwdXNl
dF9kaXJ9Cj4gKwlmaW5kIC4gLW1pbmRlcHRoIDIgLW5hbWUgJHt3aGF0fSAtcHJpbnQwIHwKPiAr
CXdoaWxlIElGUz0gcmVhZCAtciAtZCAnJyBmaWxlOyBkbwo+ICsJCXRzdF9yZXNtIFRJTkZPICJC
YWNrdXAgJHtmaWxlfSAoJChjYXQgIiR7ZmlsZX0iKSkiCj4gKwkJbWtkaXIgLXAgIiQoZGlybmFt
ZSAiJHtiYWNrdXBfZGlyfS8ke2ZpbGV9IikiCj4gKwkJY2F0ICIke2ZpbGV9IiA+ICIke2JhY2t1
cF9kaXJ9LyR7ZmlsZX0iCj4gKwkJZWNobyAiJHt2YWx1ZX0iID4gIiR7ZmlsZX0iCj4gKwlkb25l
Cj4gKwo+ICsJY2QgJHtvbGRfZGlyfQo+ICt9Cj4gKwo+ICsjIGNwdXNldF9yZXN0b3JlIDxiYWNr
dXBfZGlyPiA8d2hhdD4KPiArIyBSZXN0b3JlcyB0aGUgdmFsdWUgb2YgYSBmaWxlICg8d2hhdD4p
IGluIGFsbCBjcHVzZXQKPiArIyBncm91cHMgZnJvbSB0aGUgYmFja3VwIGNyZWF0ZWQgYnkgY3B1
c2V0X2JhY2t1cF9hbmRfdXBkYXRlCj4gK2NwdXNldF9yZXN0b3JlKCkKPiArewo+ICsJbG9jYWwg
YmFja3VwX2Rpcj0kMQo+ICsJbG9jYWwgd2hhdD0kMgo+ICsJbG9jYWwgb2xkX2Rpcj0kKHB3ZCkK
PiArCj4gKwljZCAke2JhY2t1cF9kaXJ9Cj4gKwlmaW5kIC4gLW1pbmRlcHRoIDIgLW5hbWUgJHt3
aGF0fSAtcHJpbnQwIHwKPiArCXdoaWxlIElGUz0gcmVhZCAtciAtZCAnJyBmaWxlOyBkbwo+ICsJ
CXRzdF9yZXNtIFRJTkZPICJSZXN0b3JlICR7ZmlsZX0gKCQoY2F0ICIke2ZpbGV9IikpIgo+ICsJ
CWNhdCAiJHtmaWxlfSIgPiAiJHtyb290X2NwdXNldF9kaXJ9LyR7ZmlsZX0iCj4gKwlkb25lCj4g
Kwo+ICsJY2QgJHtvbGRfZGlyfQo+ICt9Cj4gKwo+ICAgc2V0dXAoKQo+ICAgewo+ICAgCXRzdF9y
ZXF1aXJlX3Jvb3QKPiBAQCAtNjksNiArMTEyLDEwIEBAIHNldHVwKCkKPiAgIAkJCSAgICAgICAi
ZG8gbm90IGV4aXN0LiIKPiAgIAlmaQo+ICAgCj4gKwlta2RpciBjcHVzZXRfYmFja3VwCj4gKwlj
cHVzZXRfYmFja3VwX2FuZF91cGRhdGUgIiQocHdkKS9jcHVzZXRfYmFja3VwIiAke2NwdV9leGNs
dXNpdmV9IDAKPiArCWNwdXNldF9iYWNrdXBfYW5kX3VwZGF0ZSAiJChwd2QpL2NwdXNldF9iYWNr
dXAiIGNwdXNldC5jcHVzIDAKPiArCj4gICAJY3B1X2V4Y2x1c2l2ZV92YWx1ZT0kKGNhdCAke3Jv
b3RfY3B1c2V0X2Rpcn0vJHtjcHVfZXhjbHVzaXZlfSkKPiAgIAlpZiBbICIke2NwdV9leGNsdXNp
dmVfdmFsdWV9IiAhPSAiMSIgXTt0aGVuCj4gICAJCWVjaG8gMSA+ICR7cm9vdF9jcHVzZXRfZGly
fS8ke2NwdV9leGNsdXNpdmV9Cj4gQEAgLTg2LDYgKzEzMyw5IEBAIGNsZWFudXAoKQo+ICAgCQly
bWRpciAke3Jvb3RfY3B1c2V0X2Rpcn0vdGVzdGRpcgo+ICAgCWZpCj4gICAKPiArCWNwdXNldF9y
ZXN0b3JlICIkKHB3ZCkvY3B1c2V0X2JhY2t1cCIgY3B1c2V0LmNwdXMKPiArCWNwdXNldF9yZXN0
b3JlICIkKHB3ZCkvY3B1c2V0X2JhY2t1cCIgJHtjcHVfZXhjbHVzaXZlfQo+ICsKPiAgIAlpZiBb
ICIkY3B1X2V4Y2x1c2l2ZV92YWx1ZSIgIT0gMSBdOyB0aGVuCj4gICAJCSMgTmVlZCB0byBmbHVz
aCwgb3IgbWF5IGJlIG91dHB1dDoKPiAgIAkJIyAid3JpdGUgZXJyb3I6IERldmljZSBvciByZXNv
dXJjZSBidXN5Igo+IEBAIC0xMjksMTUgKzE3OSwxNSBAQCBjcHVzZXRfdGVzdCgpCj4gICAJZmkK
PiAgIAo+ICAgCSMgJHtjcHVzfSBpcyBlbXB0eSBhdCB0aGUgYmVnaW4sIHRoYXQgbWF5YmUgbWFr
ZSB0aGUgc3lzdGVtICpjcmFzaCouCj4gLQllY2hvIDAtMSA+ICR7cm9vdF9jcHVzZXRfZGlyfS90
ZXN0ZGlyLyR7Y3B1c30KPiArCWVjaG8gMSA+ICR7cm9vdF9jcHVzZXRfZGlyfS90ZXN0ZGlyLyR7
Y3B1c30KPiAgIAlpZiBbICQ/IC1uZSAwIF07IHRoZW4KPiAtCQl0c3RfYnJrbSBURkFJTCAiJ2Vj
aG8gMC0xID4iIFwKPiArCQl0c3RfYnJrbSBURkFJTCAiJ2VjaG8gMSA+IiBcCj4gICAJCQkgICAg
ICAgIiR7cm9vdF9jcHVzZXRfZGlyfS90ZXN0ZGlyLyR7Y3B1c30nIGZhaWxlZCIKPiAgIAlmaQo+
ICAgCj4gICAJbG9jYWwgY3B1c192YWx1ZT0kKGNhdCAke3Jvb3RfY3B1c2V0X2Rpcn0vdGVzdGRp
ci8ke2NwdXN9KQo+IC0JaWYgWyAiJHtjcHVzX3ZhbHVlfSIgIT0gIjAtMSIgXTsgdGhlbgo+IC0J
CXRzdF9icmttIFRGQUlMICIke2NwdXN9IGlzICcke2NwdXNfdmFsdWV9JywgZXhwZWN0ZWQgJzAt
MSciCj4gKwlpZiBbICIke2NwdXNfdmFsdWV9IiAhPSAiMSIgXTsgdGhlbgo+ICsJCXRzdF9icmtt
IFRGQUlMICIke2NwdXN9IGlzICcke2NwdXNfdmFsdWV9JywgZXhwZWN0ZWQgJzEnIgo+ICAgCWZp
Cj4gICAKPiAgIAl0c3RfcmVzbSBUUEFTUyAiQnVnIGlzIG5vdCByZXByb2R1Y2VkIgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
