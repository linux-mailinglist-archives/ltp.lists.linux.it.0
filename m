Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC92B5C95
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 11:06:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C44823C4F2B
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 11:06:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D4AB13C4AE7
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 11:06:56 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 49CE9600B44
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 11:06:56 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 9AE2DA0807;
 Tue, 17 Nov 2020 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605607614; bh=jCj78EoPwkCvJB3S8v+dclFZn2eNN91HrsksTsI3z5w=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ZCGUB80xQU68eKC8oqP95PkYZpuB37pa33e00BnsZbVR7Z1u498mpLmmnYsNnr5xx
 ECD5+lL2c7qi0HBlxvYEkqa7eVBzfJF/nBdFMedQM8iKH1I1Ya2Yi5jls90h9AZA4G
 FkFU8fWfHU4Uvk7d6LGFPj+gv9zYRti0oScAawIE=
To: rpalethorpe@suse.de
References: <20201116130915.18264-1-lkml@jv-coder.de> <875z64pc1r.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <648d7b53-2451-718b-6736-e6dffd4c72e8@jv-coder.de>
Date: Tue, 17 Nov 2020 11:06:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <875z64pc1r.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/1] overcommit_memory: Remove unstable subtest
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUmljaGFyZCwKPiBQb3NzaWJseSAvcHJvYy9zeXMvdm0vc3RhdF9yZWZyZXNoIGNhbiBiZSB1
c2VkIHRvIGZsdXNoIHRoZXNlIGNvdW50ZXJzCj4gYWZ0ZXIgY2hhbmdpbmcgdGhlIG92ZXJjb21t
aXQgcG9saWN5PwpUaGlzIHNvdW5kcyBpbnRlcmVzdGluZy4gRnJvbSB0aGUgY29kZSBJIGNhbm5v
dCBzZWUgdGhhdCBpdCB3b3JrcyB3aXRoIAp2bV9jb21taXR0ZWRfYXMuCklmIHRoaXMgaXMgbm90
IGRvbmUgd2l0aCBzb21lICJpbnZpc2libGUiIG1hZ2ljLCBJIGRvIG5vdCB0aGluayBpdCB3aWxs
IApoZWxwLgo+IEkgZ3Vlc3MgdGhhdCBpZiB0aGVzZSBjb3VudGVycyB0dXJuaW5nIG5lZ2F0aXZl
IGlzIGNvbnNpZGVyZWQgYSBidWcgdGhlbgo+IGEgd2FybmluZyB3aWxsIGJlIHByaW50ZWQgb3Ro
ZXJ3aXNlIHRoZSB0ZXN0IG5lZWRzIHRvIGJlIHNtYXJ0ZXIuCk5vIEkgZG8gbm90IHRoaW5rIHNv
LiBGb3IgY29ycmVjdCBtZW1vcnkgYWNjb3VudGluZywgdXNlZCBmb3IgZS5nLiAKQ29tbWl0ZWRf
QVMgaW4gL3Byb2MgL21lbWluZm8sIHRoZSBtZW1vcnkgaXMgc3VtbWVkIHVwIGNvcnJlY3RseSB1
c2luZyAKZ2xvYmFsX2NvdW50ZXIgKyBzdW0oY3B1X2NvdW50ZXJzKS4gSWYgZ2xvYmFsX2NvdW50
ZXIgaXMgbmVnYXRpdmUsIHRoYW4gCnRoZSBjcHVfY291bnRlcnMgYXJlIHBvc2l0aXZlIGJ5IGF0
IGxlYXN0IHRoZSBzYW1lIGFtb3VudCBhbmQgdGhlIApvdmVyYWxsIG1lbW9yeSBpcyByZXBvcnRl
ZCBjb3JyZWN0bHkgYWdhaW4uCgpUaGUgcHJvYmxlbSBoZXJlIGlzLCB0aGF0IF9fdm1fZW5vdWdo
X21lbW9yeSBpbiBtbS91dGlsLmMgdXNlcyBvbmx5IHRoZSAKZ2xvYmFsX2NvdW50ZXIgdHJ1bmNh
dGVkIGF0IDAsIHRocm91Z2ggcGVyY3B1X2NvdW50ZXJfcmVhZF9wb3NpdGl2ZS4gSSAKZ3Vlc3Mg
dGhpcyBpcyBpbnRlbnRpb25hbCwgYmVjYXVzZSBpdCBwcmV2ZW50cyBsb2NraW5nIGZvciBtZW1v
cnkgCmFsbG9jYXRpb25zLiBUaGUgc3VtbWF0aW9uIGZ1bmN0aW9uIHVzZWQgYWJvdmUgcmVxdWly
ZXMgbG9ja2luZy4KClRoZSB0ZXN0IGNhbm5vdCBrbm93IHdoYXQgdmFsdWUgdGhlIDErbmNwdSBj
b3VudGVycyBoYXZlLCBzbyBpdCBjYW5ub3QgCnByaW50IGEgd2FybmluZyBvciBhbnl0aGluZy4K
CldoaWxlIHdyaXRpbmcgdGhpcyBhbiBjaGVja2luZyB0aGUga2VybmVsIGNvZGUgSSByZWFsaXpl
ZCB0aGF0IHRoaXMgCmlzc3VlIHNob3VsZG4ndCBleGlzdCBhbnltb3JlIHdpdGggbGludXggNS45
LgpDb21taXQgNTZmMzU0N2JmYTRkMzYxMTQ4YWE3NDhjY2I4NjA3M2JjNTdmNWU2YyBzeW5jcyB0
aGUgY291bnRlcnMgKGkuZS4gCnN1bW1pbmcgdXAgdGhlIHRvdGFsIHZhbHVlIGluIHRoZSBnb2Jh
bF9jb3VudGVyKSwgd2hlbiB0aGUgb3ZlcmNvbW1pdCAKcG9saWN5IGlzIGNoYW5nZWQgdG8gTkVW
RVIuCllldCB0aGlzIHN1YnRlc3QgY2Fubm90IGJlIGNvbnNpZGVyZWQgYSB0ZXN0IGYgb3IgdGhp
cyBjaGFuZ2UsIGJlY2F1c2UgCmZvciB0aGF0IGFsbG9jYXRpb25zIGFuZCBkZWFsbG9jYXRpb25z
IGhhdmUgdG8gYmUgY2FyZWZ1bGx5IGNvbnN0cnVjdGVkLCAKdG8gdHJpZ2dlciB0aGUgYmVoYXZp
b3IgSSBkZXNjcmliZWQuCgpJIGFtIG5vdCBzdXJlIHdoYXQgbHRwJ3MgcG9saWN5IGlzIGZvciBz
dXBwb3J0aW5nIG9sZGVyIGtlcm5lbCB2ZXJzaW9ucy4gClByb2JhYmx5IG5vdCBzdXBwb3J0aW5n
IHRoZW0sIHRoZW4gdGhpcyBwYXRjaCBzaG91bGQgYmUgcmVqZWN0ZWQsIGJ1dCAKbWF5YmUgdGhl
IGNvbW1pdCBpZCBzaG91bGQgYmUgbWVudGlvbmVkIHRoZXJlLgoKSsO2cmcKCgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
