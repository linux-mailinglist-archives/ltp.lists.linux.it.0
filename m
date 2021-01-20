Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735F2FCF14
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 12:21:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45ACF3C63EF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 12:21:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9183A3C53CC
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 12:21:29 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D40611000B33
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 12:21:28 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 43B459F759;
 Wed, 20 Jan 2021 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1611141687; bh=soSvm+SKYjH+zD2x0P2m/RRMG2SNwt1AgA7u77k3jKg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Tnxf/xPO6By3cfhwRpPypq60H3/C1CIQIZf7nh/+ZOStyuj1DpaKQKu9Z2NFT4/2z
 N3hr5zhwEN+rehZj7FTZICCWDlNtG28JPrFofNarGt1fCYnXvhnVlsRbOCEatPOXhW
 ub8RENsOq+1QwcbrzKNyroUW3WiKLZYnI/BkAD0s=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210118161308.30771-1-pvorel@suse.cz> <YAaNR0PzZt5A1Fjm@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <a60fb78b-4441-4f17-d0c2-db50292cfde6@jv-coder.de>
Date: Wed, 20 Jan 2021 12:22:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAaNR0PzZt5A1Fjm@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiAxLzE5LzIwMjEgODo0MSBBTSwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSwKPgo+PiBk
aWZmIC0tZ2l0IGEvbGliL3RzdF9rZXJuZWwuYyBiL2xpYi90c3Rfa2VybmVsLmMKPiAuLi4KPj4g
LWludCB0c3RfY2hlY2tfZHJpdmVyKGNvbnN0IGNoYXIgKm5hbWUpCj4+ICsjaWZuZGVmIF9fQU5E
Uk9JRF9fCj4+ICsjIGRlZmluZSBNT0RVTEVTX0RJUiAiL2xpYi9tb2R1bGVzIgo+PiArI2Vsc2UK
Pj4gKyMgZGVmaW5lIE1PRFVMRVNfRElSICIvc3lzdGVtL2xpYi9tb2R1bGVzIgo+PiArI2VuZGlm
Cj4gT0ssIE1PRFVMRVNfRElSIGlzIG5vdCBuZWVkZWQgbm93IGFzIEkga2VwdCBBbmRyb2lkIHNr
aXBwZWQgKHVubGVzcyBzb21lYm9keQo+IGNvbnRyaWJ1dGVzIGNvZGUgb3Igc2hhcmUgYWxnb3Jp
dGhtIGZvciBBbmRyb2lkKS4KSSBkb24ndCBnZXQgdGhpcyBjb21tZW50LiBNT0RVTEVTX0RJUiBp
cyB1c2VkIGluIGJvdGggY29kZSBwYXRocyBpbiAKdHN0X3NlYXJjaF9kcml2ZXIuCkJ1dCB5b3Ug
ZG9uJ3QgY2FsbCBpdCBmcm9tIHRzdF9jaGVja19kcml2ZXIgb25seSBpZiBpdCBpcyBub3QgYW5k
cm9pZC4KSWYgdHN0X3NlYXJjaF9kcml2ZXIgaXMgc3VwcG9zZWQgdG8gYmUgYSBuZXcgcHVibGlj
IGludGVyZmFjZSwgaXQgc2hvdWxkIApiZSBhZGRlZCB0byB0aGUgaGVhZGVyLApvdGhlcndpc2Ug
aXQgc2hvdWxkIGJlIG1hcmtlZCBzdGF0aWMuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
