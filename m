Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E48F32B462D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 15:46:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 629C13C649F
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 15:46:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4EB133C4F6C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 15:46:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B23F0200BA8
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 15:46:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D02FAC83;
 Mon, 16 Nov 2020 14:46:36 +0000 (UTC)
References: <20191115101039.43386-1-lkml@jv-coder.de>
 <a42725d1-1469-e71f-e28d-1eff42e3e86d@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <a42725d1-1469-e71f-e28d-1eff42e3e86d@jv-coder.de>
Date: Mon, 16 Nov 2020 14:46:35 +0000
Message-ID: <87blfxpdf8.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4gSGksCj4K
PiBhIHBpbmcgZm9yIHRoaXMgcGF0Y2g/IElzIHNvbWV0aGluZyBsaWtlIHRoYXQgKHdvcmthcm91
bmQgZW52aXJvbm1lbnQgCj4gaXNzdWVzKSBub3Qgd2FudGVkIGluIGx0cD8KCkdlbmVyYWxseSBz
cGVha2luZywgeWVzLCBhZ2FpbiB5b3UgYXJlIHJpZ2h0IHRvIGJ1bXAgaXQgYW5kIHRoZXNlIHRl
c3RzCmFyZSBpbiBuZWVkIG9mIG1vcmUgYXR0ZW50aW9uLiBIb3dldmVyIEkgaGF2ZSBhIGNvdXBs
ZSBvZiBjb25jZXJucyBhYm91dAp0aGlzLgoKPgo+IEdyZWV0cwo+IErDtnJnCj4KPiBPbiAxMS8x
NS8yMDE5IDExOjEwIEFNLCBKb2VyZyBWZWhsb3cgd3JvdGU6Cj4+IEZyb206IEpvZXJnIFZlaGxv
dyA8am9lcmcudmVobG93QGFveC10ZWNoLmRlPgo+Pgo+PiBJZiB0aGVyZSBhcmUgYWxyZWFkeSBj
cHVzZXRzIGRlZmluZWQgb24gdGhlIHN5c3RlbSwgdGhhdCB1c2UgY3B1IDAtMSwKPj4gdGhlIHRl
c3QgZmFpbHMsIGJlY2F1c2UgaXQgdHJpZXMgdG8gZXhjbHVzaXZlbHkgdXNlIGNwdSAwLTEgZm9y
IHRoZQo+PiB0ZXN0Y2FzZS4KPj4KPj4gVGhlIGZpeCBzZXRzIHRoZSBjcHVzZXQgZm9yIGFsbCBj
Z3JvdXBzIHRvIDAgYW5kIGRpc2FibGVzIGV4Y2x1c2l2ZQo+PiBjcHUgdXNhZ2UgZm9yIHRoZSBk
dXJhdGlvbiBvZiB0aGUgdGVzdCBhbmQgcmVzdG9yZXMgaXQgb24gY2xlYW51cC4KPj4gRm9yIHRo
ZSB0ZXN0IG9ubHkgY3B1IDEgaXMgc2V0IGFzIGV4Y2x1c2l2ZS4gVGhpcyBpcyBlbm91Z2ggdG8K
Pj4gdHJpZ2dlciB0aGUgYnVnIHRoaXMgcmVncmVzc2lvbiB0ZXN0IHdhcyBkZXNpZ25lZCBmb3Iu
Cj4+IFRoaXMgd2FzIHRlc3RlZCBieSByZXZlcnRpbmcgdGhlIGNvbW1pdCBtZW50aW9uZWQgaW4g
dGhlIHRlc3RjYXNlLgoKSWYgdGhlIHN5c3RlbSBoYXMgYWxyZWFkeSBzZXQgZXhjbHVzaXZlIGNw
dXMgdGhlbiBpdCBpcyB1bmxpa2VseSB0aGlzCnJlZ3Jlc3Npb24gZWZmZWN0cyBpdC4gRWl0aGVy
IHRoZSBrZXJuZWwgaGFzIGJlZW4gcGF0Y2hlZCBvciB0aGUgc3lzdGVtCm1hbmFnZXIgY29uZmln
dXJlcyB0aGUgY3B1cyBmaXJzdCBiZWZvcmUgc2V0dGluZyB0aGUgZXhjbHVzaXZlIGtub2IuCgpO
b3JtYWxseSBJIHdvdWxkIHNheSB0aGUgdGVzdCBzaG91bGQgdHJ5IHRvIHJ1biBhbnl3YXksIGJ1
dCB5b3UgYXJlCmhhdmluZyB0byBtYWtlIHNvbWUgaW50cnVzaXZlIGNoYW5nZXMgdG8gdGhlIGNn
cm91cCBzZXR1cCB3aGljaCBjb3VsZApsZWFkIHRvIG90aGVyIHByb2JsZW1zLgoKU28gd2h5IG5v
dCBqdXN0IGNhbGwgJ3RzdF9icmsgVENPTkYnIGlmIHRoZSBzeXN0ZW0gYWxyZWFkeSBoYXMgZXhj
bHVzaXZlCmNwdXMgY29uZmlndXJlZD8KCi0tIApUaGFuayB5b3UsClJpY2hhcmQuCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
