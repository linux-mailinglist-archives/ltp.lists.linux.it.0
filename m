Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C039BFDE
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 20:49:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDF473C4FB9
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 20:49:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 390343C27F0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 20:49:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0ED39600D60
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 20:49:28 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F19221A38;
 Fri,  4 Jun 2021 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622832568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AX/WV3RIi0Ahjw7AS9dtLKS8U2bUiCWXBDfknsB+N+g=;
 b=GnaC7bJV3/c7D4KrgNYjf5wBlicPFW9tzhPoqieQBKTsm2I/2wgvhZUfNyX83CljA8hCNR
 ABSek+HQ/xSay4X76YbEK5YvlJZH05evlH/eFo381F01ArQG023yvXq1pV/JYtLipM3Tas
 KnsfRC53x2qRs9kQA/IDsKKMHsrV26Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622832568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AX/WV3RIi0Ahjw7AS9dtLKS8U2bUiCWXBDfknsB+N+g=;
 b=XBMm1e7nf6A4P/cJ10qRdEwsYL0rfh68QhD7nR+xK8qvYCrUR/mRhfT+LQegrtuYzRFzJe
 u6ZejIk7qtbuunDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 238FA118DD;
 Fri,  4 Jun 2021 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622832568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AX/WV3RIi0Ahjw7AS9dtLKS8U2bUiCWXBDfknsB+N+g=;
 b=GnaC7bJV3/c7D4KrgNYjf5wBlicPFW9tzhPoqieQBKTsm2I/2wgvhZUfNyX83CljA8hCNR
 ABSek+HQ/xSay4X76YbEK5YvlJZH05evlH/eFo381F01ArQG023yvXq1pV/JYtLipM3Tas
 KnsfRC53x2qRs9kQA/IDsKKMHsrV26Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622832568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AX/WV3RIi0Ahjw7AS9dtLKS8U2bUiCWXBDfknsB+N+g=;
 b=XBMm1e7nf6A4P/cJ10qRdEwsYL0rfh68QhD7nR+xK8qvYCrUR/mRhfT+LQegrtuYzRFzJe
 u6ZejIk7qtbuunDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id y40KBrh1umDtXQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 18:49:28 +0000
Date: Fri, 4 Jun 2021 20:49:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Enji Cooper <yaneurabeya@gmail.com>
Message-ID: <YLp1sSlda6bEncO8@pevik>
References: <20210603183827.24339-1-pvorel@suse.cz>
 <20210603183827.24339-2-pvorel@suse.cz>
 <392BDC1B-F73E-411E-AE03-71DA0CBAB2D8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <392BDC1B-F73E-411E-AE03-71DA0CBAB2D8@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/3] make: Add make check{,-c,-shell} targets
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgRW5qaSwKCj4gPiBPbiBKdW4gMywgMjAyMSwgYXQgMTE6MzggQU0sIFBldHIgVm9yZWwgPHB2
b3JlbEBzdXNlLmN6PiB3cm90ZToKCj4gPiBGb3IgdGVzdGluZyBDIGFuZCBzaGVsbCBBUEkuCgo+
IFdoeSBub3QganVzdCBhZGQgYSBzaW5nbGUg4oCcbWFrZSBjaGVja+KAnSB0YXJnZXQgdGhhdCBj
YWxscyB0aGUgQyBhbmQgc2hlbGwgdGFyZ2V0cyB0byBtYXRjaCB3aGF0IG1vc3Qgb3BlbiBzb3Vy
Y2UgcHJvamVjdHMgZG8gaW4gdGVybXMgb2YgdGVzdGluZz8gQWxzbywgY29udGludWluZyBvbiBp
biBsaWdodCBvZiBlcnJvcnMgc2VlbXMgbGlrZSBhIGdvb2QgZGVmYXVsdCBiZWhhdmlvciB0byBo
YXZlIGFzIGl0IHdvdWxkIHByZXZlbnQgYSBzaW5nbGUgZXJyb3IvZmFpbHVyZSBmcm9tIGdhdGhl
cmluZyBhbGwgb3RoZXIgcmVzdWx0cy4KClllcywgdGhlIG9yaWdpbmFsIGFwcHJvYWNoIGluIHRo
aXMgcGF0Y2hzZXQgaXMgbWFrZSBjaGVjaywKd2hpY2ggY29uc2lzdHMgb2YgdHdvIG1ha2UtYyBh
bmQgbWFrZS1zaGVsbC4gT25lIG9mIHRzdF9mdXp6eV9zeW5jIGNoZWNrcyBpcwpxdWl0ZSBsb25n
IGFuZCBpbiBsb25nZXIgdGVybSB0aGUgbnVtYmVyIG9mIHRlc3RzIGZvciBib3RoIEMgYW5kIHNo
ZWxsIEFQSSBtaWdodApncm93IHRvIHByb2xvbmcgdGhlIHRlc3RpbmcuIFRodXMgb25lIG1heSBh
cHByZWNpYXRlIHRvIHRlc3QgZm9yIGxvY2FsCmRldmVsb3BtZW50IGp1c3Qgb25lIG9mIHRoZXNl
IHR3by4KCk9yLCBpZiB5b3UgbWVhbiBob3cgaXQgaGFzIGJlZW4gaW1wbGVtZW50ZWQgKGFkZGlu
ZyB0ZXN0cyBpbnRvIHZhcmlhYmxlcyksCkkgcGxhbiB0byBhZGQgZG9jcGFyc2UgdGVzdHMgKGlu
dG8gZG9jcGFyc2UvdGVzdHMvKSAtIGkuZS4gaW50byBkaWZmZXJlbnQKZGlyZWN0b3J5LgoKQWxz
bywgcmVzdWx0IG9mIFJpY2hpZSdzIExpYmNsYW5nIGJhc2VkIGFuYWx5emVyIHBhdGNoc2V0IFsx
XSwKd2hlcmUgaGUgYWxzbyBhZGRlZCBtYWtlIGNoZWNrLCB3ZSBkZWNpZGVkIHRvIHVzZSBtYWtl
IHRlc3QgaGVyZSBbMl0uCgo+IE15IDIgY2VudHMsClRoYW5rcywgY29tbWVudHMgYXJlIGFsd2F5
cyB3ZWxjb21lLgo+IC1FbmppCgpLaW5kIHJlZ2FyZHMsClBldHIKClsxXSBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L3BpcGVybWFpbC9sdHAvMjAyMS1KdW5lLzAyMzAwOC5odG1sClsyXSBodHRwczov
L2xpc3RzLmxpbnV4Lml0L3BpcGVybWFpbC9sdHAvMjAyMS1KdW5lLzAyMzAyMS5odG1sCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
