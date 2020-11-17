Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978D2B5E92
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 12:48:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECB1B3C5F83
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 12:48:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C6D353C4F1E
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 12:48:21 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C0D0D200D4F
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 12:48:20 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0B813A0807;
 Tue, 17 Nov 2020 11:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605613699; bh=SDS7oVqHKaLUk/NVlsPR7pllfSMipx+iDrVZuFLebrU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=SXhmfoekyy+vhojpuyVil2dxc+sKWc4o17zneO/koACKU9n+D//cSR04kDAZLhsHF
 QMHD6OAbXGqchEO4x2HPKdgOLZ6CwnW3cisV0u8zLtZnU57QF4xRgxOOwg59pmUQwj
 ukBbHnWFCm5H9c831V8Eb9VRP+6DE7cW2M8wenPY=
To: rpalethorpe@suse.de
References: <20201116130915.18264-1-lkml@jv-coder.de> <875z64pc1r.fsf@suse.de>
 <648d7b53-2451-718b-6736-e6dffd4c72e8@jv-coder.de>
 <873618p7ns.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <0d2a3cc5-e257-ebc5-1488-2a186411d8ad@jv-coder.de>
Date: Tue, 17 Nov 2020 12:48:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <873618p7ns.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
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

SGkKPiBJIHRoaW5rIGluIGdlbmVyYWwgb2xkZXIgdmVyc2lvbnMgYXJlIHN1cHBvcnRlZCwgYXQg
bGVhc3QgYmFjayB0byAyLjYKPiAoYWx0aG91Z2ggeW91IG1heSBuZWVkIHRvIGNvbXBpbGUgaW4g
YSBuZXdlciB1c2VyIGxhbmQpLiBIb3dldmVyIGl0Cj4gZGVwZW5kcyBvbiB0aGUgdGVzdCwgc28g
d2UgbWF5YmUgY291bGQgZGlzYWJsZSB0aGUgdGVzdCBvbiBvbGRlcgo+IGtlcm5lbHMsIGJ1dCBj
aGFuZ2VzIGxpa2UgdGhlIGFib3ZlIGFyZSBvZnRlbiBiYWNrcG9ydGVkIHRvIG9sZGVyCj4ga2Vy
bmVscy4uLgo+Cj4gUG9zc2libHkgdGhlIHRlc3Qgc2hvdWxkIGJlIGNvbnZlcnRlZCB0byBjaGVj
ayBmb3IgcmVncmVzc2lvbnMgdG8gdGhlCj4gYWJvdmUgY29tbWl0PyBXaGljaCB3aWxsIHByb2Jh
Ymx5IGFsc28gdGVzdCB3aGV0aGVyIHNldHRpbmcgb3ZlcmNvbW1pdAo+IHdvcmtzIGFzIGEgYnlw
cm9kdWN0Lgo+CkluIHRoYXQgY2FzZSwgSSB3b3VsZCB2b3RlIHRvIGVpdGhlciByZW1vdmUgdGhl
IHN1YnRlc3QsIG9yIG1ha2UgaXQgbW9yZSAKcGVybWlzc2l2ZSwgYnkgdXNpbmcgc29tZXRoaW5n
IGxpa2UgMS41eCBjb21taXRfbGltaXQuIFRoYXQgbWlnaHQgYWxzbyAKZmFpbCwgYnV0IGlzIHZl
cnkgbGVzcyBsaWtlbHkuCgpGb3IgdGhlIG5ldyBjaGFuZ2UgSSB3b3VsZCByYXRoZXIgY3JlYXRl
IGEgbmV3IHRlc3QsIHRoYXQgdGVzdHMgZXhhY3RseSAKdGhpcyBjaGFuZ2UsIGFsdGhvdWdoIHRo
ZSBtb3JlIGFjY3VyYXRlIGFjY291bnRpbmcgaXMgbW9yZSBvciBsZXNzIGEgCmJ5LXByb2R1Y3Qg
b2YgdGhlIGNoYW5nZSwgdGhhdCBpcyBub3QgZXZlbiBkb2N1bWVudGVkIHRoZXJlLi4uIFRoaXMg
aXMgCmFsbCBhYm91dCBjaGFuZ2luZyB0aGUgYmF0Y2ggc2l6ZS4gVGhleSBqdXN0IGFkZGVkIHRo
ZSBzeW5jaHJvbml6YXRpb24gCm9mIHRoZSBjb3VudGVycywgYmVjYXVzZSB0aGV5IGVubGFyZ2Ug
dGhlIGJhdGNoIHNpemUgZm9yIHBvbGljaWVzLCBidXQgCk5FVkVSIGFuZCB0aGF0IGNvdWxkIGxl
YWQgdG8gdGhlIHNpdHVhdGlvbiBJIGRlc2NyaWJlZCBldmVuIG1vcmUgZnJlcXVlbnRseS4KTm93
IHRoYXQgY29kZSBvZiBtbV9jb21wdXRlX2JhdGNoIGJlZm9yZSB0aGUgY2hhbmdlLCBJIHdvbmRl
ciBob3cgdGhpcyAKd2FzIGV2ZW4gcG9zc2libGUuLi4gVGhlIGJhdGNoIHNpemUgd2FzIGNvbnN0
YW50LCBpZiBubyBtZW1vcnkgaG90cGx1ZyAKb2NjdXJyZWQuIFNvIG5vcm1hbGx5IGFsbG9jYXRp
b25zIGFuZCBkZWFsbG9jYXRpb24gc2hvdWxkIGJlIGFjY291bnRlZCAKZm9yIGluIHRoZSBzYW1l
IGNvdW50ZXIgdHlwZSAoYWx0aG91Z2ggbWF5YmUgdGhlIGNwdSB0aGF0IGRvZXMgdGhlIAphY2Nv
dW50aW5nIG1heSBkaWZmZXI7IGFsbG9jYXRlZCBvbiBjb3JlIDAgZGVhbGxvY2F0ZWQgb24gMSku
CkJ1dCBuZXZlciBhbGxvY2F0ZWQgb24gYSBjcHUgY291bnRlciBhbmQgZGVhbGxvY2F0ZWQgb24g
dGhlIGdsb2JhbCBjb3VudGVyLgoKT2hoIHRoaXMgY291bGQgYmUgbXJlbWFwOgpJZiBhIG1lbW9y
eSByZWdpb24gaXMgYWxsb2NhdGVkIHdpdGggbW1hcCBhbmQgdGhlbiBncm93biB3aXRoIG1yZW1h
cCwgCnRoaXMgbWF5IGxlYWQgdG8gdGhlc2Ugc21hbGwgYWxsb2NhdGlvbnMgYmVpbmcgYWRkZWQg
dG8gdGhlIHBlciBjcHUgCmNvdW50ZXJzIGFuZCB0aGUgZGVhbGxvY2F0aW9uIG9mIHRoZSBiaWdn
ZXIgcmFuZ2Ugc3VidHJhY3RlZCBmcm9tIHRoZSAKZ2xvYmFsIGNvdW50ZXIuIFRoaXMgY291bGQg
YmUgZS5nLiBhIHN0YWNrLCB0aGF0IGhhZCB0byBncm93LgpJIHdvbmRlciBpZiB0aGlzIGNvdWxk
IG92ZXJmbG93IHRoZSBnbG9iYWwgY291bnRlciwgaWYgZG9uZSBvZnRlbiBlbm91Z2guCgpKw7Zy
ZwoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
