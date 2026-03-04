Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJxNFkf5p2mtmwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 10:20:07 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3F1FD7A0
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 10:20:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772616006; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : mime-version : content-type : content-transfer-encoding :
 sender : from; bh=hYJjxL5F7LhKOU8UZm2l0F1m+1R+MMVXhlomsFEGg1A=;
 b=D3YJbF6Guh8vhrhmlNJxJcRcwx/f3B+wKZ2ukj5Gtx5XaLezzuMz3RB+1Ky+xzGEb/syy
 1k7/Kcat/TeQWoXsM1IeDLKF0fLdIfKhJVt4q+Xh6+B9CGQ4tHeyFmBFVP20kEl3lEZ5Sxq
 4/vytW3i78G1pzKAFissqxmr2IckPpg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DE673DAC8A
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 10:20:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB1143CB27C
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 10:20:03 +0100 (CET)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 20A2D1400C64
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 10:20:02 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439aeed8a5bso3642482f8f.3
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 01:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772616002; x=1773220802; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kJ322FUUHIHZekRehL98JyKdmPlbKQxfGHntQtbK7dg=;
 b=atdMYSZYhKnaAgW1SS3PORyM9Kwfpn+T74rs+EOX/jdCnuvoqjBVysHXFGn5MuvbGd
 5EUuNFlXe+Yx8oVNRp3ctZmjbeG/r41vlObA1GdThEjH38cBTLhNFlAMo4JnMr+mUCcp
 Xpti+a0F03myznoOULRtdPJ+9AnHH/MlA6FpSq9LDzgnTI4KwU933KFwGTX6z+X+oEi3
 Jczq8wFrDMUNRC0bhe7R06UbUoPJZZ4uZ1CC42drTPEKdHx2S8T4tFaOxBfe1Lu7cg7o
 eXSWk7yNRRTWEKYsQsi6Mc75B9p9PeV+B8KxV+TxihccUkixTsANtEnSK4cq+kCmXRCC
 ADOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772616002; x=1773220802;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJ322FUUHIHZekRehL98JyKdmPlbKQxfGHntQtbK7dg=;
 b=NkcNMKRIXDgNng8VaRzEC4Owr+1fd/cSTVbsHk1cxI05E/fMnLDvTsm/dSzVjnQCpI
 D0NakEgp4CvB+4onbSii8ZqVCy0w5Z7mAaBcPQPtPcO6zEG1ofA61mXyMSk1xTsMtsxk
 TTuelpSmDh6KxJVjqQlQBV/GYyhtKmrKf0Ba95Wfhxv4wujGyCxUEfKtD9SpwkaICHX7
 7OdWPDwe61mJYK2Cc3iCCqVrNIIBQTGrJg8JDRVGtuw27VsW1Kw39gqbBMjYPyhjD30o
 WhfnwhpTx8T4JBxf1VmW8RH7oR/KtPUYW9eRPeS73pqIQ33Ehmul4bDHtk4G1/CzVran
 gT7w==
X-Gm-Message-State: AOJu0YxoOS6my+zZtF6hdu6jKlLiJyORBBxI758GLGqpRJGtGg8ZGffb
 TbuJPTceR53F7hIujsVNjHt2yfbrh5nb5BgcSA6/RtfM1J2E+Detv8MOHio6XP0KFzy97oquEj6
 mNrQrklY=
X-Gm-Gg: ATEYQzyE9bDYtFHIyuRN7DEODV2T+N0PiD+640BQOSivkZQfxieONgVu7zhXlyQCpaM
 7uvPRYAgGkmRtZ8k91ygeaQqTfy5oIgdyj45sVZbkEsXavmJY/BgsSNqysMwGVShpB3oAJd4pQH
 r21SvOUn4EwZeIwr4nvcikaYeOMMNasjYY7BYeFEAOaYk4IMVEkVTQEJXSGPI1D+xZHOHWLAOh8
 NGb0yI7wgt76CPCDBXvDNNe57iajoAcsrYiQIG+IeDmFSIpNvewtd79UGpgOggPLUkaWu3r4D3S
 C5pp4qoTW92KiJcuycQpM2jSXH+N1eoB6I7WMCsnBHmPKKKSUjmCr86NxOzEyDru3iqTzY3r5im
 FAOS8Oe0+K/nyKgVPJEN4RENTGVDFN3tlLXeXjn7GpgftCk1zjOC+yyVok24vCpBJT0Bnpln5zL
 1WdR99JQpoceHuIlmRSYTwd4qTpBk8S6h4X0ZwCZOx0p/wESGU7+q9ILFcDrX6UYIQA8Uvdoi44
 dQ0iU5pjwEJ6CegGDhnKT+7eeuIf6YDUB0=
X-Received: by 2002:a5d:5d85:0:b0:439:b6d6:71a with SMTP id
 ffacd0b85a97d-439c8024aa2mr2553038f8f.51.1772616001736; 
 Wed, 04 Mar 2026 01:20:01 -0800 (PST)
Received: from localhost.localdomain
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b6d540b2sm21788828f8f.36.2026.03.04.01.20.00
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:20:00 -0800 (PST)
Message-ID: <69a7f940.5d0a0220.27e3ef.38eb@mx.google.com>
To: "Li Wang via ltp" <ltp@lists.linux.it>
In-Reply-To: <20260304034034.59303-1-liwang@redhat.com>
Date: Wed, 04 Mar 2026 09:19:59 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 1/2] lib: Extend -D flag to support multiple
 debug levels
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: ECD3F1FD7A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,suse.com:email,mx.google.com:mid]
X-Rspamd-Action: no action

> +
> +Suppress all debug logs if no '-D' flag passed (by default behavoir).
                                                                  ^
								   behavior

The rest looks fine:

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
