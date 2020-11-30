Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0672F2C8050
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:54:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FD613C2C92
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:54:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 086463C2555
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:54:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AE3DF60075A
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:54:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12627AC55;
 Mon, 30 Nov 2020 08:54:45 +0000 (UTC)
References: <20201127071419.20370-1-lkml@jv-coder.de> <87360rnuio.fsf@suse.de>
 <01818271-8dba-96a3-76f3-575243c93243@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <01818271-8dba-96a3-76f3-575243c93243@jv-coder.de>
Date: Mon, 30 Nov 2020 08:54:44 +0000
Message-ID: <87zh2zmdgr.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] overcommit_memory: Fix unstable subtest
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4gSGksCj4+
PiArc3RhdGljIGxvbmcgZ2V0X3RvdGFsX2JhdGNoX3NpemVfYnl0ZXModm9pZCkKPj4+ICt7Cj4+
PiArCXN0cnVjdCBzeXNpbmZvIGluZm87Cj4+PiArCWxvbmcgbmNwdXMgPSB0c3RfbmNwdXNfY29u
ZigpOwo+PiBJJ20gbm90IGNvbXBsZXRlbHkgc3VyZSBpZiB0aGlzIGlzIHRoZSBzYW1lIHZhbHVl
IGFzIG51bV9jcHVzX3ByZXNlbnQoKQo+PiBpbiB0aGUga2VybmVsPyBJJ20ganVzdCB3b25kZXJp
bmcgaWYgQ1BVIGhvdHBsdWdnaW5nIGNvdWxkIHJlc3VsdCBpbiB0aGUKPj4gd3JvbmcgdmFsdWUg
YmVpbmcgY2FsY3VsYXRlZCAob3RoZXIgdGhhbiBpZiBpdCBpcyBob3RwbHVnZ2VkIHdoaWxlIHRo
ZSB0ZXN0Cj4+IGlzIHJ1bm5pbmcpLgo+Cj4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhpcyBhcyB3
ZWxsIHdoZW4gSSBpbXBsZW1lbnRlZCB0aGlzLiBIZXJlIGlzIG15Cj4gcmVhc29uaW5nOgo+Cj4g
SWYgaG90cGx1ZyBpcyBkaXNhYmxlZCBwb3NzaWJsZT1wcmVzZW50IGFuZCBwb3NzaWJsZT1uciBj
cHVzIGF0Cj4gYm9vdC4gT3RoZXJ3aXNlIHByZXNlbnQgaXMgdGhlIHJlYWwgbnVtYmVyIG9mIGV4
aXN0aW5nIChub3QKPiBuZWNlc3NhcmlseSBlbmFibGVkIGNwdXMpLCBhbmQgcG9zc2libGU9TlJf
Q1BVCj4gSW4gYm90aCBjYXNlcyBpdCBpcyB0aGUgbnVtYmVyIG9mIGNwdXMgaW5zdGFsbGVkIGlu
IHRoZSBzeXN0ZW0sCj4gZW5hYmxlZCBvciBub3QuCj4KPiB0c3RfbmNwdXNfY29uZiBpcyBfU0Nf
TlBST0NFU1NPUlNfQ09ORiwgd2hpY2ggaXMgZG9jdW1lbnRlZCBhcwo+ICJyZXR1cm5zIHRoZSBu
dW1iZXIgb2YgcHJvY2Vzc29ycyB0aGUgb3BlcmF0aW5nIHN5c3RlbSBjb25maWd1cmVkLiBCdXQK
PiBpdCBtaWdodCBiZSBwb3NzaWJsZSBmb3IgdGhlIG9wZXJhdGluZyBzeXN0ZW0gdG8gZGlzYWJs
ZSBpbmRpdmlkdWFsCj4gcHJvY2Vzc29ycyBhbmQgc28gdGhlIGNhbGwiLCBpbiBjb250cmFzdCB0
byBfU0NfTlBST0NFU1NPUlNfT05MTgo+ICJyZXR1cm5zIHRoZSBudW1iZXIgb2YgcHJvY2Vzc29y
cyB3aGljaCBhcmUgY3VycmVudGx5IG9ubGluZSAoaS5lLiwKPiBhdmFpbGFibGUpLiIuCj4KPiBJ
IHdvdWxkIGludGVycHJldCBfU0NfTlBST0NFU1NPUlNfQ09ORiBhcyBlcXVhbCB0byBwcmVzZW50
IGFuZAo+IF9TQ19OUFJPQ0VTU09SU19PTkxOIGFzIGVxdWFsIHRvIG9ubGluZS4KPgo+IEFueXRo
aW5nIGZsYXcgaW4gbXkgbG9naWM/Cj4KPiBKw7ZyZwoKVGhpcyBzb3VuZHMgY29ycmVjdCwgaXQg
d291bGQgYmUgc3RyYW5nZSBpZiBfU0NfTlBST0NFU1NPUlNfQ09ORgpyZXR1cm5lZCBudW1fcG9z
c2libGVfY3B1cygpLgoKLS0gClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
