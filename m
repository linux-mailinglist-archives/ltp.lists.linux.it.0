Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMAqBjltlGkEDwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 14:29:29 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24314C927
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 14:29:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771334968; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=eXEbAnXUTPUsY4m9l+im+4v/5XHEeN0JdwKYYUpVa3s=;
 b=TfYkGub8B40hWUKi0hwn7vcWMMpJJZe17lZTumYJB50aGvMZjevIgRGVibYVHW33wNcuU
 6DDrGDrNnDM2YR2XgMg/OIL3J0a48MlNVcH67aWC2QHTCraH/poAg3Ppl2PGSCTykE56Orp
 eU9V9uSzkKrkUWnZ+aVgSSNHWC8lCjU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 572543D0628
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 14:29:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 067983C5720
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 14:29:25 +0100 (CET)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6B2AB2005CB
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 14:29:25 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-437711e9195so2951735f8f.1
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771334965; x=1771939765; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4iY3neWYZA0ckNlPyVbQbUb5YLUaeMoDo6YEqaJ8FY=;
 b=ZdcY2s5zRqLGzoJi13LJb+thTqsPHlnBjsACkNDkXYTfguPavGRH0L3ZRGiP0fjYls
 rA1fDk4o9VJsHyg7iqCE9ypCJN7r9UoE6k1NwY/Ppof0x1JRncFjqsvPP1W34xzp9nwl
 /ZYCc8S8GlVfQRx0Xf8LkdF+ikPJ+MjCLHNaNFoTdsyoQdDjh5WH1uU1u8L1BBaf+oId
 k9cUL/1YCL0q8uCEtoGvHqX18WKM4MVF97JreLg2+n8sM8lybMFHiLU6EZL2+eI9OI6X
 JjKvNREIhx0O4S5iM7GXaoz3pEu4uSWxfTumFML7L9PiH3MDm0ASi6n7Wz1BW6A75tPh
 LCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771334965; x=1771939765;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q4iY3neWYZA0ckNlPyVbQbUb5YLUaeMoDo6YEqaJ8FY=;
 b=hou+1QSW64mbwtZsVDXRLvTfr4nJVu2MieX5fVLOtyBww7FPPvZmd8GIJsXYXCHLKi
 ppm5WZC/KWQDIiUhOe2b1nXGVFUejlHJ1vuHz2AdHBOd0ndIA+no1/IicvuVRAE33+x1
 ZVBqZXhgGdTnEzBG9bdF4WAjSBmJvI+Q7jC6DDSqYI6s1dN4ZKz4EETlT8eV5my47Dhz
 kGe6UwNoAZPCqRJrg6tEDU07lm0CguA66GWMvukCMZNggC31cpasfHgoyEI0FLw0haYK
 1TJFUD+Bc3LpOt7GX7FuqXadHh9sfx2IhkH4o9ezTbovAh1Yv8aYDYcfrIiab92qCTZU
 l5Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdaRBQCTJB5S61lBxmCGdLHmLW0Ji1ytRopSzXA0M5q10avAt48IaYAWc2ITUhzDMXuSE=@lists.linux.it
X-Gm-Message-State: AOJu0YzYWjcgf5eGo2x6y1z5xEFZTJ5aHC+l3+Be3qwqD1vOUgQpWHBQ
 ddQmcXFDufDhHMcoLtzgXJr3Y7nnn1SWDtC5IJZrFc8VidVBZx9u5ffimoquzpkVBwA=
X-Gm-Gg: AZuq6aJMGkRrg4s0UbgRWxXU0s/jh0L2cxuhE46MwL/pdAWjylKhy6Vo6W5/PURHCUm
 aSBIPRpc5LcLfxwFU69C1sCndhoc1cBzR3V6iG18Uzzr4EMXZOdpdFIkiXORIZNWzwDpVfF4xyi
 Kuk74rC1iYwQFTkFMpZp+sDwkudeNIlSeikzA7FwMITd6cNY9X4oX8Xv6appjpEPlo1gcEWbige
 MWnvc6MrB+5Dst0eU4qfCb46jPzFXuUKrgSqxFUneWTW2cFNk9OcrSCLy7U/xyB4VsDKA3ENHJP
 C2jQxx9tvjkpgdDXobk7f41+7Acq2BXyGK4UWEO5wyDuYDXKk+nrvK+mUVb6DVEV8WoUXmORv+y
 rnZK0S49BRHCdhWidI4vUbcJIZS+2Bow0MnWyfkHs99o3TFyaKI8opZ94Fzkr4LFMynIIGaFwIE
 LzRyVlkot58TEmsEv7WnmnTy18Sf/y70Mmwgay/W//DyxLsoYuLkTERLSoNGKl1xInURY7KQntQ
 GYpE/NYL8rVXmGv6oBHlbTJF29tkQ==
X-Received: by 2002:a05:6000:603:b0:435:9d70:f299 with SMTP id
 ffacd0b85a97d-43796ac2063mr23530481f8f.22.1771334964684; 
 Tue, 17 Feb 2026 05:29:24 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796acffcesm31687625f8f.37.2026.02.17.05.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 05:29:24 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 17 Feb 2026 14:29:23 +0100
Message-Id: <DGH9U8LALY49.15D20CTE4T52F@suse.com>
To: "Jinseok Kim" <always.starving0@gmail.com>, <pvorel@suse.cz>,
 <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260216102039.GB136260@pevik>
 <20260216165015.1710-1-always.starving0@gmail.com>
In-Reply-To: <20260216165015.1710-1-always.starving0@gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] inotify: cleanup - limit masks, use SAFE_ wrappers
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.cz,lists.linux.it];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim,linux.it:url]
X-Rspamd-Queue-Id: AE24314C927
X-Rspamd-Action: no action

T24gTW9uIEZlYiAxNiwgMjAyNiBhdCA1OjUwIFBNIENFVCwgSmluc2VvayBLaW0gd3JvdGU6Cj4g
SGkgVm9yZWwsCj4KPiBUaGFua3MgZm9yIHRoZSByZXZpZXchCj4KPiAtIGlub3RpZnkxMi5jIG5l
ZWRzIHJlYWQoKSBiZWNhdXNlIEVBR0FJTiAo4oCcbm8gc2Vjb25kIGV2ZW504oCdKSBpcyBhCj4g
dmFsaWQgY2FzZSB0aGF0IG11c3QgYmUgZXhwbGljaXRseSBkZXRlY3RlZCBhbmQgdHJlYXRlZCBh
cyBJTl9JR05PUkVELgo+Cj4gLSBpbm90aWZ5MDcuYyBkb2VzIG5vdCByZXF1aXJlIHRoaXMgZGlz
dGluY3Rpb246IFNBRkVfUkVBRCgpIGlzIGVub3VnaCwKPiBzaW5jZSBFQUdBSU4ganVzdCBtZWFu
cyBlbmQtb2YtZXZlbnRzLCB3aGlsZSByZWFsIGVycm9ycyBhcmUgaGFuZGxlZCBhcwo+IFRCUk9L
LCBtYXRjaGluZyB0aGUgb3JpZ2luYWwgdGVzdCBpbnRlbnQuCj4KPiBCZXN0IHJlZ2FyZHMsCj4g
Smluc2Vvay4KCgpMR1RNCgpSZXZpZXdlZC1ieTogQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNl
cnZlc2F0b0BzdXNlLmNvbT4KCi0tIApBbmRyZWEgQ2VydmVzYXRvClNVU0UgUUUgQXV0b21hdGlv
biBFbmdpbmVlciBMaW51eAphbmRyZWEuY2VydmVzYXRvQHN1c2UuY29tCgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
