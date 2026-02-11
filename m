Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI2vACJ7jGkcpgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 13:50:42 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D8712487B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 13:50:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770814241; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=3e+SO1cCtPb4YDlT0gYHaBUwFqsqv7f67EE6g6SCGY8=;
 b=jvW7yfNdbXt6yOqPxni6o2F371436mm1xKPAxfYKF2R5hUjttKiG6HHzH/vLaoeY9haAB
 WFwGZzG3jIYTHpq1Ety4rvZ/5NqiihQK6keFqlt3c5MY8Dn7SYZZMcxVIL69sLAGB4UoQgn
 zExevF0QSX2WCUKprMiFmhSbtGfaql4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AD233CE48A
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 13:50:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 232753CE229
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 13:50:28 +0100 (CET)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DC7A2600931
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 13:50:23 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43590777e22so3259459f8f.3
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 04:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770814223; x=1771419023; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MT0kWGHy9ACsh4ZHbtzpvhXL/jqAPGC36M6tDd3j6sI=;
 b=M3HsC8ca0R+UMCyjbmq7yi/sdgZxT9I05rZ/sNSOGIexn7YnLOhUdpPKZT5eOC2oFi
 TGBPUX0wlgF5owHmt9fzZ6aOe52aONL2zAkq2lRhHJvRFYRzdfMcBL9z4mPDeOnhgTQn
 YfefEA3qtfy527JF8LcauTBu35vuq/fWGaRwDYzFaEeodOXb1kACCq4zSLaE84sLGaRe
 QPQM/K07UeixQaJt9CMQtv8adY3FL6xx2/xHb53JsfHB654Wy3ig1rCpMwHjxXyC7/us
 Dsa+WhYABxUksLdqw8cxv6BLue8oCuza/U0yY4pDtI2/m0yfqU+rvkibeSyUGeXRn4ZI
 PTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770814223; x=1771419023;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MT0kWGHy9ACsh4ZHbtzpvhXL/jqAPGC36M6tDd3j6sI=;
 b=UUOXyP35UMR9P2aus0alJj3lhcmK6MlCdquUnqdOucdMz+ho5L2VvkObr8osernvii
 E1W9BJ9SjVaLukX9bR3GdT0HOy3xHKaPCjtQub1IVPgEGuTratfQHxaX0H2+9uxuR6J6
 rQWumiAKKtiqVWtcFMp+UxA/QOKZQil2Pj6dUetOL5hRs8UT6RVzD4xTeIrwE0U6Onrc
 5yQWsTYp8bD0XY7Itomn9CwzfQHdbnTJT/i2+7zT5pwDw7Z+CF6H+dyfZbINOFFcIR64
 uAm/pPycilv4DASI95qmKcxckpxU1VD606SVtMGTvsK97eAtel8LpBwGr3w6k3ADAVJr
 sktg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgb8fhgsOlaL668DnJQXl/1OoVhcV3Nf911H/k5mbW4V0JeDf4hNPkzulqz/CX+WFZvJU=@lists.linux.it
X-Gm-Message-State: AOJu0YyKzBCADrdnQ7UB5EYKvox+OB8bmqNjKZ87m/us3p6gRzzFje8+
 etet/uUkt0uJOdWLucZ2isT6Ua9ggSb6Jc5Ey9voV/SCzjvfcvyD54/V1c2KcuvpKUUuM8qxfYW
 1xYNyZXs=
X-Gm-Gg: AZuq6aJNV74p51XX86tYpI7pH1lv1Ii9MxrE2pT5mNMDSvspS5r+gucR/nTMFsh6SHo
 a6oqDX7GzTD7XPJ9KlR7Olrkz8W2AOGuR+IEE4eeB27OGKI8Jq8AleaDZrvE9EDQKRaZLN/+jGm
 mHidi1EE+ltIai7GvMys1CNC2HZ8klhsAUu8QVbaFK2Xl8rSd54rQm9k2lsWMfbe2wLQMtnLkQA
 wECn554QEe0jnUiAs9RzqdYlgPVpgAgMaN2tXYDrtOMKQCl3ujg10bOtLrFXkXj0+AfJSjpreij
 m/Gj8xb/WhNnaUCXoqboLsUKbshns8Y1WbV9yBWu6m7666G8AoQPJP/gLM3NohyScYajHmW9CCC
 6JqsAqKu1YEFq+PmYtfJdzbTLHmTlY703Wv39R4fgH6IjMiz4OWUl1+KnpBljXQT+zJr8RBrkXC
 oFTJHQ+q1LbgBjBVLx4CmYzoXOiIw=
X-Received: by 2002:a05:6000:2c02:b0:437:719d:a754 with SMTP id
 ffacd0b85a97d-43782cafdaemr3964517f8f.47.1770814222815; 
 Wed, 11 Feb 2026 04:50:22 -0800 (PST)
Received: from localhost ([37.162.249.193]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d34657sm5360021f8f.6.2026.02.11.04.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 04:50:22 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 13:50:20 +0100
Message-Id: <DGC5929U93ZZ.MPNXJWSC5I9L@suse.com>
To: "Andrea Cervesato" <andrea.cervesato@suse.com>, "Martin Doucha"
 <mdoucha@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260203125029.15413-1-mdoucha@suse.cz>
 <20260203125029.15413-3-mdoucha@suse.cz>
 <DGC57EJ5ML0P.1QXZU4BD77ITM@suse.com>
In-Reply-To: <DGC57EJ5ML0P.1QXZU4BD77ITM@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] openposix/aio_cancel: Use setup helper
 functions in tests 5 and 7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim,linux.it:url]
X-Rspamd-Queue-Id: A3D8712487B
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 1:48 PM CET, Andrea Cervesato wrote:
> Hi!
>
> LGTM
>
> Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

My error, this message for the 1/3. Please ignore.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
