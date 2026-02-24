Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAI8KzKdnWnwQgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:44:34 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE1187241
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771937073; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=UcK4chQ/hqnWXmJP6MlFAxhSuR0VdOGcdJCzzvBnF/0=;
 b=e3DFlPS/fL3ODS5lAvuuW9XZAKTVhVo+Z35EI8bAjNpO1hE44I4zMvCXYVrcobXGeXk1J
 wd7HLkpyDN/db3kO6yqy4n5Y652NeZ8+XR0UpRvXaHiePdNiuOadMCcqEmzQLA/5M9bHKRc
 azeAd2lTGLCL3zyGFqJEA4NStNljw+E=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE46C3D0F90
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:44:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B6F4A3C5AB1
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 13:44:30 +0100 (CET)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0174A10005FB
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 13:44:29 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so21243085e9.0
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 04:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771937069; x=1772541869; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmoYj1ei+FsnTOxJbGTBi4hDSFL4FVInEI7eW8vgb0E=;
 b=b1xgwCmdkilYE7TESq2OFSyx2nY4Kp/63hUlZ6YW8LuixFzUb++burPe3p3wpW48qG
 D+AMjwg74n+v/mwDH+BOxqbbIOFF8aE5ycgI1WL2r1s9Qvh4aERua9ZjYhlp7gEZTEWc
 Q7CJ9DyWRjPI0B2nS3c/LomgIE7zZAaVKqB25srHU8nS4oFJabwNIVvCX5F050hql+Fq
 fNkVX5Z4o466douCXKxqtODoN+yk7vyZRaSb7TdrSVAmIhyUKb1ZoUI+DotJJR3LExdy
 TH3s8YXk1zrsGpSK5YJXAITTbRZf5KjhJc1AZgLVcEqlwP4xVbUIVX8/YMu5Au1G+hZz
 o9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771937069; x=1772541869;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RmoYj1ei+FsnTOxJbGTBi4hDSFL4FVInEI7eW8vgb0E=;
 b=W9PIofqG/0Wy+nzCua8HyDkafqiQXkwaD5RkilSmLlSF6/hJ1dsTLDgyUxdx31EBk/
 Ze7TSP5Nv5O7NUxzhFsiS/Cf4lqbwbmd2Cf50fcqp+Q+zKVqx48Z4a2oOuXd3RGYAfck
 uTG/DCzvV6x0BgLpYt8wCnTxxvQcDvTPGHruG3kViaNG6sxf66J8+0OmI4jd60QAl+Qz
 5l1DHBuedkNS+xck8A20vBAq8l9p4jHOOx6pPM3fBmkqWcUxZhpIV/WN64WJoVUwrPbp
 SubL3oKyVsUS5GjsjBy7pbcj1mqUmJjRU+rC+rgK2bmCGmsxP3MBw3hsGcItt2aUkaDy
 dnmw==
X-Gm-Message-State: AOJu0YzZsZmf/X5d6y3RB3BF+NyfjNZL3oAAcAyWOL52cm2u9GRZjVWt
 PoHpNwdBPbIXG0sv8FzU3Upvxd8eUujx8qfPeQIjUGxfNBJRX1jraf9ViHuTq+BYXgM=
X-Gm-Gg: AZuq6aL94zijOYcIunocGve5tBydyaZAzqbi1a32zSOYubcRWa+FOPB4lkRfpGXJpSR
 GwerdIqpiCRlgP8lJrfl3m+JCGI6VA8j8Mw/oPtnWVZSP++6eKwyS6lL2C3tQe0qS4VS0ARnf9J
 ERN71qRsPHVEmp2K7x0ZULwxQcIJCdVzmWFMO+ciJ0PXPMM7zQVISZcckkPkOC8DqNy7RytXLqk
 mH5n3bb68+1BiPdY4jwgv+6H1dBOw2sZlPWo64mKfDUE+HgMNxQ9asvaoOLf3LABLjRVBhHNwDI
 Hy/k4OH3wzWIrgZRU6PA+qFRluXnZBXXnBrCjn2sgNy5emNTQMm4sdQX7bSJ8dmYkPOnsfhgLTF
 5y/1gLq6H8bvZuuolAHiQQI0FYh3XaFwZVXRpkUJf0hpHAjUQcjGZOGAqvplUE0auQkOd0+vj/q
 qCVePMpyAB/f0xfJ+Ol0nP/rU8
X-Received: by 2002:a05:600c:46c9:b0:483:6f37:1b51 with SMTP id
 5b1f17b1804b1-483a95ea9c9mr177077815e9.23.1771937069339; 
 Tue, 24 Feb 2026 04:44:29 -0800 (PST)
Received: from localhost ([88.128.90.16]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b75b4dsm438191765e9.4.2026.02.24.04.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 04:44:29 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 13:44:27 +0100
Message-Id: <DGN79ND5W6YE.3D8FPN9CFMP8Y@suse.com>
To: "Jan Polensky" <japo@linux.ibm.com>, <chrubis@suse.cz>,
 <pvorel@suse.cz>, <jstultz@google.com>
X-Mailer: aerc 0.18.2
References: <20260224104544.101292-1-japo@linux.ibm.com>
In-Reply-To: <20260224104544.101292-1-japo@linux.ibm.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 1/1] sched_football: harden kickoff
 synchronization on high-CPU systems
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim,linux.it:url];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com]
X-Rspamd-Queue-Id: 3CDE1187241
X-Rspamd-Action: no action

Hi!

It looks good to me, but I'm wondering if we can use
TST_CHECKPOINT_WAIT2() in here to sync multiple threads instead of using
pthrea barriers which are a bit more complex.

Kind regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
