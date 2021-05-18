Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE73870CD
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 06:55:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98DF53C5FF0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 06:55:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64EA73C5FD4
 for <ltp@lists.linux.it>; Tue, 18 May 2021 06:55:31 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A0F496008DC
 for <ltp@lists.linux.it>; Tue, 18 May 2021 06:55:30 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 97E749F9A5;
 Tue, 18 May 2021 04:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1621313728; bh=Hcp+OIVVmBVW6DJD5w5h0DlqzLPbUAxX0VHckXkMcvQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=XbT0M3g3G5kmUsM8lXWEQZZ1XWQ3vKb7o61zIOYaAoGkJ7L19KCiaZA1BGhFvFy76
 EXxdmjFT+I3V8rBlyped5PDIMtOBri7tu5hZ6aKwn1WB93wlc6W49Di5HruG+PAPZW
 HGAnsKOWSw45NbIPNhKgeb4AdqNJ5H7gw+62PJbA=
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
 <YJvkFTUWS2iuZ00H@pevik>
 <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <a4154e09-8ae3-beb3-13d5-c92126177ed5@jv-coder.de>
Date: Tue, 18 May 2021 06:57:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgpPbiA1LzEzLzIwMjEgNzowOCBBTSwgTGkgV2FuZyB3cm90ZToKPj4gRllJIEkgdHJp
ZWQgdG8gdXNlIGJvdGggU0lHSU5UIGFuZCBTSUdURVJNLCBidXQgdGhlcmUgd2FzIHNvbWUgcHJv
YmxlbS4KPj4gQnV0IEkgZ3Vlc3MgaXQgd2FzIG15IGVycm9yLiBQbGVhc2UgKmFkZCogU0lHVEVS
TSAoa2VlcCBTSUdJTlQpLgo+IFllcywgd2UnZCBiZXR0ZXIga2VlcCBTSUdJTlQgZm9yIGN0cmxe
YyBhY3Rpb24gYW5kIHVzZSBTSUdURVJNCj4gYWRkaXRpb25hbGx5IGZvciBwcm9jZXNzIHRlcm1p
bmF0aW5nLgo+Cj4gRG9lcyB0aGlzIGJlbG93IChyb3VnaCBzb2x1dGlvbiBpbiBteSBtaW5kKSB3
b3JrIGZvciB5b3U/Cj4KPiBkaWZmIC0tZ2l0IGEvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90aW1l
b3V0MDMuc2gKPiBiL2xpYi9uZXdsaWJfdGVzdHMvc2hlbGwvdGltZW91dDAzLnNoCj4gaW5kZXgg
Y2Q1NDhkOWEyLi5mMzlmNTcxMmEgMTAwNzU1Cj4gLS0tIGEvbGliL25ld2xpYl90ZXN0cy9zaGVs
bC90aW1lb3V0MDMuc2gKPiArKysgYi9saWIvbmV3bGliX3Rlc3RzL3NoZWxsL3RpbWVvdXQwMy5z
aAo+IEBAIC0zMCw2ICszMCw3IEBAIFRTVF9USU1FT1VUPTEKPgo+ICAgZG9fdGVzdCgpCj4gICB7
Cj4gKyAgICAgICB0cmFwICJlY2hvICdTb3JyeSwgdGltZW91dDAzIGlzIHN0aWxsIGFsaXZlJyIg
VEVSTQo+ICAgICAgICAgIHRzdF9yZXMgVElORk8gInRlc3Rpbmcga2lsbGluZyB0ZXN0IGFmdGVy
IFRTVF9USU1FT1VUIgo+Cj4gICAgICAgICAgc2xlZXAgMgo+IGRpZmYgLS1naXQgYS90ZXN0Y2Fz
ZXMvbGliL3RzdF90ZXN0LnNoIGIvdGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaAo+IGluZGV4IDI4
YzIwNTJkNi4uZDdjOTc5MWU5IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Qu
c2gKPiArKysgYi90ZXN0Y2FzZXMvbGliL3RzdF90ZXN0LnNoCj4gQEAgLTIxLDcgKzIxLDcgQEAg
ZXhwb3J0IFRTVF9MSUJfTE9BREVEPTEKPiAgIC4gdHN0X3NlY3VyaXR5LnNoCj4KPiAgICMgZGVm
YXVsdCB0cmFwIGZ1bmN0aW9uCj4gLXRyYXAgInRzdF9icmsgVEJST0sgJ3Rlc3QgaW50ZXJydXB0
ZWQgb3IgdGltZWQgb3V0JyIgSU5UCj4gK3RyYXAgInRzdF9icmsgVEJST0sgJ3Rlc3QgaW50ZXJy
dXB0ZWQnIiBJTlQKVGhpcyB3b3VsZCByZXF1aXJlIHNvbWV0aGluZyBsaWtlCnRyYXAgInRzdF9i
cmsgVEJST0sgJ3Rlc3QgdGVybWluYXRlZCciIFRFUk0Kb3IKdHJhcCAiX3RzdF9kb19leGl0IiBU
RVJNCgpPdGhlcndpc2UgdGhlIHRlc3QgaXMgdGVybWluYXRlZCB2ZXJ5IHJvdWdobHksIHdpdGhv
dXQgZXhlY3V0aW5nIApjbGVhbnVwLCB3aGljaCBpcyBwcm9iYWJseSBub3QgYSBnb29kIGlkZWEu
CgpCdXQgdGhhdCBpbnRyb2R1Y2VzIHRoZSBuZXh0IHByb2JsZW06IEEgc2hvcnQgZGVhZGxvY2sg
YmV0d2VlbiAKX3RzdF9raWxsX3Rlc3QgYW5kIF90c3RfY2xlYW51cF90aW1lciwKYmVjYXVzZSBf
dHN0X2NsZWFudXBfdGltZXIgd2FpdHMgZm9yIHRoZSB0ZXJtaW5hdGlvbiBvZiB0aGUgdGltZW91
dCAKcHJvY2VzcyBhbmQgdmljZSB2ZXJzYS4KQW5vdGhlciBwcm9ibGVtIGlzLCB0aGF0IGEgU0lH
VEVSTSBvcmlnaW5hdGluZyBmcm9tIHNvbWUgb3RoZXIgbG9jYXRpb24gCmNvdWxkIGxvb2sgbGlr
ZSBhIHRpbWVvdXQuCgpJIGFtIGN1cnJlbnRseSB0aGlua2luZyBhYm91dCB0aGUgZm9sbG93aW5n
IHNvbHV0aW9uLCB0byBtaXRpZ2F0ZSBtb3N0IApwcm9ibGVtczoKVGhlIHRpbWVvdXQgcHJvY2Vz
cyBzZW5kcyBTSUdVU1IxIChvciBtYXliZSBTSUdBTFJNPykgb25seSB0byB0aGUgbWFpbiAKdGVz
dCBwcm9jZXNzIGFuZCBibG9ja3MgVEVSTS4KVGhlIG1haW4gcHJvY2VzcyBjYW4gcHJpbnQsIHRo
YXQgaXQgcmFuIGludG8gYSB0aW1lb3V0LCBzZW5kIGEgc2lndGVybSAKdG8gaXRzIHByb2Nlc3Nz
IGdyb3VwICh3aGlsZSBpZ25vcmluZyBURVJNIGl0c2VsZikuClRoZW4gaXQgY2FuIHVuc2V0ICRf
dHN0X3NldHVwX3RpbWVyX3BpZCBzYWZlbHksIGJlY2F1c2UgaXQga25vd3MgaXQgd2FzIAp0cmln
Z2VyZWQgYnkgdGhlIHRpbWVvdXQgcHJvY2VzcyBhbmQgZXhlY3V0ZSBfdHN0X2RvX2V4aXQuCgpJ
ZiB0aGUgdGltZW91dCBwcm9jZXNzIGRvZXMgbm90IHNlZSB0aGUgdGVybWluYXRpb24gb2YgdGhl
IG1haW4gcHJvY2VzcywgCml0IGNhbiBzdGlsbCBzZW5kIFNJR0tJTEwgdG8gdGhlIHdob2xlIHBy
b2Nlc3MgZ3JvdXAuCgpKw7ZyZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
