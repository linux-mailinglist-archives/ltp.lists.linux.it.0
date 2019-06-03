Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59165331CD
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:12:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18BC1294AF5
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:12:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 00010294AC4
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:12:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 58D12200B32
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:12:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84E2EAF0F
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 14:12:49 +0000 (UTC)
Date: Mon, 3 Jun 2019 16:12:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190603141251.GC13662@dell5510>
References: <20190228153425.10286-1-chrubis@suse.cz>
 <20190228153425.10286-3-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190228153425.10286-3-chrubis@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/mbind0{2, 3,
	4}: Add basic mbind tests
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SEkgQ3lyaWwsCgo+ICsjaW5jbHVkZSA8ZXJybm8uaD4KPiArI2luY2x1ZGUgImNvbmZpZy5oIgo+
ICsjaWZkZWYgSEFWRV9OVU1BX0gKPiArIyBpbmNsdWRlIDxudW1hLmg+Cj4gKyMgaW5jbHVkZSA8
bnVtYWlmLmg+Cj4gKyNlbmRpZgo+ICsjaW5jbHVkZSAidHN0X3Rlc3QuaCIKPiArI2luY2x1ZGUg
InRzdF9udW1hLmgiCj4gKwo+ICsjaWZkZWYgSEFWRV9OVU1BX0gKVGhpcyBuZWVkcyB0byBiZSB0
ZXN0ZWQgYWdhaW5zdCBIQVZFX05VTUFfVjIgdG8gZ2V0IHByb3BlciBsaWJudW1hIGRldGVjdGlv
biBpbgpjcm9zcy1jb21waWxhdGlvbiBbMV0gWzJdOgoKL3RtcC9jY2xWTkV6NS5vOiBJbiBmdW5j
dGlvbiBgdmVyaWZ5X3BvbGljeSc6Ci91c3Ivc3JjL2x0cC90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL21iaW5kL21iaW5kMDQuYzo0NjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbnVtYV9hbGxv
Y2F0ZV9ub2RlbWFzaycKL3Vzci9zcmMvbHRwL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbWJp
bmQvbWJpbmQwNC5jOjUxOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBudW1hX2JpdG1hc2tfc2V0
Yml0JwovdXNyL3NyYy9sdHAvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYmluZC9tYmluZDA0
LmM6NTM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHRzdF9udW1hX21hcCcKL3Vzci9zcmMvbHRw
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbWJpbmQvbWJpbmQwNC5jOjU1OiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBtYmluZCcKL3Vzci9zcmMvbHRwL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvbWJpbmQvbWJpbmQwNC5jOjU4OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB0c3RfbnVtYV9t
b2RlX25hbWUnCi91c3Ivc3JjL2x0cC90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21iaW5kL21i
aW5kMDQuYzo2NDogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgdHN0X251bWFfbW9kZV9uYW1lJwov
dG1wL2NjbFZORXo1Lm86IEluIGZ1bmN0aW9uIGBudW1hX2ZyZWVfbm9kZW1hc2snOgovdXNyL2lu
Y2x1ZGUvbnVtYS5oOjE4MzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbnVtYV9iaXRtYXNrX2Zy
ZWUnCi90bXAvY2NsVk5FejUubzogSW4gZnVuY3Rpb24gYHZlcmlmeV9wb2xpY3knOgovdXNyL3Ny
Yy9sdHAvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYmluZC9tYmluZDA0LmM6Nzg6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYHRzdF9ub2RlbWFwX2NvdW50X3BhZ2VzJwovdG1wL2NjbFZORXo1
Lm86IEluIGZ1bmN0aW9uIGBzZXR1cCc6Ci91c3Ivc3JjL2x0cC90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL21iaW5kL21iaW5kMDQuYzozNDogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgdHN0X2dl
dF9ub2RlbWFwJwpjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKCklk
JyBwZXJzb25hbGx5IG1vdmUgbnVtYSBpbmNsdWRlcyBhZnRlciBpdC4KCktpbmQgcmVnYXJkcywK
UGV0cgoKWzFdIGh0dHBzOi8vYXBpLnRyYXZpcy1jaS5vcmcvdjMvam9iLzU0MDc1NDE1Ny9sb2cu
dHh0ClsyXSBodHRwczovL3RyYXZpcy1jaS5vcmcvcGV2aWsvbHRwL2J1aWxkcy81NDA3NTQxNTQK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
