Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC523B42A7
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 13:39:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37AC23C6EF1
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 13:39:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 137013C2B69
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 13:39:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 76504601032
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 13:39:23 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id ED1E521C80;
 Fri, 25 Jun 2021 11:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624621162;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmXiOK9PZTn9qMG9cs8Y9y8omxdmNSSloBQNSKbI/Fg=;
 b=u+sb2UDliCoXFT4P6OG2MhNYx1cxd14/R2qNVtkMzTrPJf8GVwL7uRDihlNTgIsro5B0Ec
 y+Il44UdkW9CrvKm4gUgGkxQ0pqJyPxxNGyCfiXM4gga6WN2qvLnkD5SMYjv7xZztfrOxs
 jDRdVgsnKLKYPIS/L0zKbOYZjlJMKiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624621162;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmXiOK9PZTn9qMG9cs8Y9y8omxdmNSSloBQNSKbI/Fg=;
 b=+coiO+rB/Nm0UGTIgqNAYgR6c7wFFnyNMCK+PlGd+CKh/NPnKutP5uMlQy5+nZLDeSGUvF
 a8DZjtknTvHZXPBA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A0255A3BB4;
 Fri, 25 Jun 2021 11:39:22 +0000 (UTC)
References: <fc235ab1-4796-c1d4-d5b0-f1f112c9ce54@jv-coder.de>
 <YNRZKs9cHbGxzg4Q@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YNRZKs9cHbGxzg4Q@pevik>
Date: Fri, 25 Jun 2021 12:39:22 +0100
Message-ID: <878s2y41hx.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC] fs_bind rework
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gYWxsLAoKPj4gVGhpcyB3b3VsZCBtYWtlIGV2ZXJ5IHNpbmdsZSBmc19iaW5kIHRlc3Qg
YSBzaW5nbGUgbHRwIHRlc3QgKH4xMDApLgo+PiBJIGRvIG5vdCB0aGluayB0aGF0IHJ1bnRpbWUg
aW5jcmVhc2VzIHNpZ25pZmljYW50bHksIGJlY2F1c2UgYXMgZmFyIGFzIEkgc2VlCj4+IGl0IGZy
b20gZmlyc3QgZ2xhbmNlLCB0ZXN0X2ZzX2JpbmQuc2ggcmVzZXRzIHRoZSAic2FuZGJveCIgdXNl
ZCBmb3IgdGhlCj4+IHRlc3RzIGJlZm9yZSBldmVyeSB0ZXN0IGFueXdheS4KPiBZZXAsIEkgd291
bGRuJ3QgYmUgd29ycnkgYWJvdXQgaW5jcmVhc2VkIHJ1bnRpbWUsIHRoaXMgaXMgYWN0dWFsbHkg
dGhlIHByZWZlcnJlZAo+IGFwcHJvYWNoLiBBbHNvLCB2YXJpb3VzIHRlc3RzIGNhbiBiZSBwcm9i
YWJseSBncm91cGVkIGludG8gc2luZ2xlIHNoZWxsIHRlc3QsCj4gd2l0aCAkVFNUX0NOVCAobG9v
a2luZyBpbnRvIHRlc3RzIGluIGZzX2JpbmQvY2xvbmVOUykuCgpJIGd1ZXNzIHRoZXJlIGlzIG5v
IHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgaW4gdGhpcyBjYXNlLiBXaGF0IHJlYWxseQptYXR0ZXJz
IGlzIGlmIHRoZSB0ZXN0cyBhcmUgYWxsIGp1c3Qgc2xpZ2h0IHZhcmlhdGlvbnMgb24gZWFjaCBv
dGhlci4gU28KaGF2aW5nIHRoZW0gaW4gb25lIGZpbGUgbG9va3MgbmljZSBhbmQgc2hvd3MgZXhh
Y3RseSB3aGF0IHRoZQpkaWZmZXJlbmNlcyBiZXR3ZWVuIHRlc3RzIGFyZS4KCj4KPj4gSWYgdGhl
cmUgaXMgbm8gb2JqZWN0aW9uLCBJIHdvdWxkIGdpdmUgY29udmVydGluZyB0aGUgdGVzdHMgYSBz
aG90Lgo+ICsxCj4KPj4gSsO2cmcKPgo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCgoKLS0gClRoYW5r
IHlvdSwKUmljaGFyZC4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
