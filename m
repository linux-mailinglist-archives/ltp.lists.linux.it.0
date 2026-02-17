Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ObgDaFBlGlhBQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 11:23:29 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C408F14ACC3
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 11:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771323807; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=TFQ0IZu9TjP0/H7nSxR5HzgtqMwi15kJg/uoHU7L2js=;
 b=SlzcbqbpOWYPIZUogeR0VQPu/Gd9qIPPEPj+7b1X1aSjAjwlNVK6aNdGutq9NW1XILQ5r
 3kflAC9Pzf3cE+Tf5BbZYHFjYCy7kxTohe9bD0UiNf5rhbjPPfGJqIqa0h+2GuNoD8ESILL
 b88lHNWxLIBtjumwcbzkbdGZc/OPoJw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8173A3D062B
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 11:23:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 048A83CC713
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 11:23:24 +0100 (CET)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BD08860020A
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 11:23:22 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so37822065e9.1
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 02:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771323802; x=1771928602; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2FSW7TknW+b+LteADoyHpUym2MF/oTqEXeTyal2WTE=;
 b=boIDBYKT8LQGPSo1YgWRvtn4ADZOKgvHK2Mwe7136CyxnNbz58YlrASmpFW/i8m+dq
 8ERFJ55/7ydDxhMeCvKJDWNhmPGlq+Y2SiKlT6dCszvmY9Z39F9qkzciJCcEwb0NK1hm
 GE81lCfnmcTUa4tPFJ+qYD4zkTfPNpWwU3fiFPRRW1BC+lWhw0s47EQGfrn1PPcLyz/j
 4EiCBk4vHeUeLA5MXTQvSF3DmgFYEm1jnAplsGFWAT2x5Qf2PhTA+c4IHOwGlOZx3BGf
 /9hWlCMG+FrPk8H9xMOqqNgjU+GaueY583a2ay74ygWyv1WrBmY589FQOcQVyZZ5MoAY
 GMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771323802; x=1771928602;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P2FSW7TknW+b+LteADoyHpUym2MF/oTqEXeTyal2WTE=;
 b=r2xJf0Ig8UX+kiQkj1L+8+HSdfb0N9v2hYeA9B8H0TEAbf+1mH5McGrLBmyTWpsYgh
 CnzIdFYjCQtG8+E993zxFhC8dI+rkrvv5o08c8m9g2lGBZMs14/kprJQNOMwY7PmRXSi
 QcQuKH2qdhd1Sv82d1IdaEcxmI3v2I4S5t+0WLAtE6jT1uu6H/joidpslNS5I5GANwUP
 o75vN2hLa0RrwNhF/vYbrPI+QK9lhiRWGM+oXCbcfhe9BO7ntEBhPb/PobuHVYLQVc3u
 FwDzX7R3pb+UxjbIRrS9/3+K+qUAV+pLD7ozTv/kFFCH9yzjftScBotdyakdl203XS6/
 LxPA==
X-Gm-Message-State: AOJu0YwxzpoqzyVk8O6t8/me3yRMUT/s9XmJgSaM/I56JD0xzCVfQZHM
 alHiszru77ifZuSbnhrDWcK0gBunwTF6j5yHpqYSi0hVaBFcxA23af9l5BWc+OB6niG7DvCpAY3
 aTVURyik=
X-Gm-Gg: AZuq6aL8RhBLgwSN/7fV+we6fsHAnamUpc0+VQFz8XDUK6gAQges9QDY6TzdKc2rB0S
 JXT3FIcaGdVl2paNykHzabUB+aY+FhriXPeK+v8kWMuib34UdddTdCqSt6AT+UczBk026+J26mg
 nw4OFOvZxPIDa2rbW8Xr+TVdoMLu+5Hy/ux04wlkj+AeR7W0WSBYOBFTYK1Y2Rqw5IvrGV0O4bs
 d2+ei8XmwACuZ1oYE1Nk75eSwDvlE1ikqpbxcf6YhXH8bpTUh+tdtgVAhkBjzJb2cfPBRDl+TDX
 GK94Ovy/Cqztts7BPmKsnsl2BQlzAVziLEqdUMB5jjkksQK7IbYIWexlGYPuo/HsIhiMnjdXnot
 h6enzpc4dTfy9S/sR7rSipw09h4wR0w+k/rFk8XwqRLjH7YGE6k04S6cGLcNcaWcok0RRvJr0oE
 YsELLEJhszAVHl7DNufAvJT6sId49+g27J6kQrPxk7aW1hZNis9uTM5syMQi7cUjkhb/seiNH3c
 hUEiC9KsV+88ZomJD8=
X-Received: by 2002:a05:600c:3144:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-48373a6d36bmr200869655e9.27.1771323802070; 
 Tue, 17 Feb 2026 02:23:22 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4837b68e5adsm307492745e9.9.2026.02.17.02.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 02:23:21 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 17 Feb 2026 11:23:21 +0100
Message-Id: <DGH5VSH24OZM.2MGZOUVM6R1HF@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, "Petr Vorel" <pvorel@suse.cz>
X-Mailer: aerc 0.18.2
References: <20260205121540.329921-1-pvorel@suse.cz>
 <20260205121540.329921-2-pvorel@suse.cz> <aZQytH7k6pVXqdsz@yuki.lan>
In-Reply-To: <aZQytH7k6pVXqdsz@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/6] doc: INSTALL: dma_thread_diotest.c: Remove
 runltp from doc
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
Cc: ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url]
X-Rspamd-Queue-Id: C408F14ACC3
X-Rspamd-Action: no action

I also noticed there are a couple of bugs in the documentation, where
kirk command is still used with the -U (framework) parameter. That
should be probably fixed.

Kind Regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
