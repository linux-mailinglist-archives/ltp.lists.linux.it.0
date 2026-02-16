Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDIdLORKk2mi3AEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 17:50:44 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50099146687
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 17:50:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7F6F3D0535
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 17:50:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18A463D04E6
 for <ltp@lists.linux.it>; Mon, 16 Feb 2026 17:50:42 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A2BCD14001EA
 for <ltp@lists.linux.it>; Mon, 16 Feb 2026 17:50:41 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id
 41be03b00d2f7-c6e2a8db928so1278566a12.1
 for <ltp@lists.linux.it>; Mon, 16 Feb 2026 08:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260640; x=1771865440; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z0/gM2r7l05GE4Q71d21mpQOJfBKaSof2JxYJsVKEn8=;
 b=IpDwdotSlzFJczN7QqoqzlinBtwt9xlrsEi1vqMz1r3tG79PhlrrSnfXubAosePefo
 iVE5NY57A9BNFCG6fyM+2itEOK6u2leppn6Iqtyatqwyw1JKOzziqmY+IoJ7SaO5viVW
 1FDnwlMx4xze9XiMyiHPQnHXuYdS+I0lr1OKcxx4HLHZbPurw3Z9w0/LxycorneMNQx3
 zdcjFcSfZM6O7ho3/tZeq36L73H1IEG1E7Z27gEirF3PDb+xb/SToY4Vy9kaVTBivqNK
 TKVzKQmOB2EJFybJA4bSu0IGy3laWtliHeTPkuEn4jM1O8ZKBqnTFTMMiyug9NP1srKq
 Y4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260640; x=1771865440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z0/gM2r7l05GE4Q71d21mpQOJfBKaSof2JxYJsVKEn8=;
 b=VOKzT7bKxz0HpCDy5vRmSxZepRiugKh427TVbsQVGWaLfvFsTJuvtdiq1iwSdNK97/
 Sp6UbMMHI7jsbDXc/hxxhGbPLbDLljKWo+U4fouHas0dGT7u2PBF0sERdzESw7/h6XkY
 TLobY7PqYL5o5cDN6fIwZ84NwyfwJrRAMtI8+H9H3kaAYdHlGH/zvY9IZbnScH20d+AA
 Vwoja9V2po32yFJnp8HOm2Q7TnRe/gbcYMXxoR+6g2eLVjoJE0LNuZC0XEX4KAR94VTn
 2ic3HbGrrtMqrob71lQ6SXVAMNVMvitKN1sx9GPCMeOkGtFpLt8wmZ7t/ZpJnY7gTQFM
 NogQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTFOQ+DO91YeurmSSCIM/jJlXh7pWIwo9tbNU1hbtydZAl4jRZSq0veCab6JomaZbJ0Ek=@lists.linux.it
X-Gm-Message-State: AOJu0YzR1ynvTsKkZwoa09B09H70QYfQfQ8y5E7zCR+G6/GteTfSrVTw
 AJ8mhSeoQXDdc30+gRIfZb3hjCyG9gDprJ6mLa7uPEP/Gsg37i3ZFxw=
X-Gm-Gg: AZuq6aIWcEWwXXby5I7Q1SOzWnQTdw9qF42g9OL3HCRBPWKPl14NI+CDfMZ1/2KSXvh
 K/3A/wE//lu2ZAnVX2uve2L0Oh4RM/6FnbkDCPNaB2xLbIaQDF0ILiSCIlNb2qne3WFMgy7SYyP
 xvFOQvucNGjbrF8HHeGo+wsFEw1Y7xx49N+BHDZIov8HjHAJzoRTI30N2ergaCdwMWMhTGbhzEI
 +EPWhul5KmWl5wsgjA90qL72YjYV3o4/IYgW7Ot94BZAOuzXqXvsYMvl6iVrDtl0zQrTG3e5SrV
 r8/AokNy0d5mYc3GjQhCV4YB4q60Lid8HoJcxs3uZJPUiZVVl5iEunPG2lk8NhANQq3WY98RIkx
 yCKMnuWbp3h9TBA0VHJ32mH48Bs0qNPRax73AU3wJ3U5KHgHFqsd5sKTDN3DCbWp8vwClbsMaYy
 cIYeaATkntYrUGb4jZ2gsbI66C/Uzuih3EJZkGHJ5S1A==
X-Received: by 2002:a17:90b:5405:b0:356:2eac:b650 with SMTP id
 98e67ed59e1d1-3584481ab25mr6380691a91.3.1771260639639; 
 Mon, 16 Feb 2026 08:50:39 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567ebc4331sm16492573a91.16.2026.02.16.08.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:50:39 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Tue, 17 Feb 2026 01:50:12 +0900
Message-ID: <20260216165015.1710-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216102039.GB136260@pevik>
References: <20260216102039.GB136260@pevik>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] inotify: cleanup - limit masks, use SAFE_ wrappers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 50099146687
X-Rspamd-Action: no action

SGkgVm9yZWwsCgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgotIGlub3RpZnkxMi5jIG5lZWRzIHJl
YWQoKSBiZWNhdXNlIEVBR0FJTiAo4oCcbm8gc2Vjb25kIGV2ZW504oCdKSBpcyBhCnZhbGlkIGNh
c2UgdGhhdCBtdXN0IGJlIGV4cGxpY2l0bHkgZGV0ZWN0ZWQgYW5kIHRyZWF0ZWQgYXMgSU5fSUdO
T1JFRC4KCi0gaW5vdGlmeTA3LmMgZG9lcyBub3QgcmVxdWlyZSB0aGlzIGRpc3RpbmN0aW9uOiBT
QUZFX1JFQUQoKSBpcyBlbm91Z2gsCnNpbmNlIEVBR0FJTiBqdXN0IG1lYW5zIGVuZC1vZi1ldmVu
dHMsIHdoaWxlIHJlYWwgZXJyb3JzIGFyZSBoYW5kbGVkIGFzClRCUk9LLCBtYXRjaGluZyB0aGUg
b3JpZ2luYWwgdGVzdCBpbnRlbnQuCgpCZXN0IHJlZ2FyZHMsCkppbnNlb2suCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
