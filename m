Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y+syEap+jGl9pwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 14:05:46 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8F124A2F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 14:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770815145; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=RW6NwJC3f8riVds5Np0WvKUQ6uy4zW59S0V0t2jAtSo=;
 b=apOWjRe946I70JN1wS+akgtBuo9umb6jh2V3vT0UGj27LX9G1nbrYzonFEG8KL0/wPGov
 iBNXr3BpuKtV0qmIUQ0ZD7KcHfQLLx9x7uJFwaV2rQhBccY+Y/qONlgRclnhYl2+jbdaMyX
 Hqd4oZAhr/gWZhkd2lNeBgQqAV43K/4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A7F23CE4E6
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 14:05:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 06D863CA0E3
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 14:05:31 +0100 (CET)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5E4761400B6C
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 14:05:31 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so615940f8f.1
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 05:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770815131; x=1771419931; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6AqLYWfpSFXOSvJwEf6e+C+LlA8G7GSh9PquU8bEgek=;
 b=AQoqAecGgqhlasMlzEW+FnKo4ujtKAjrlEnoFFtbH7zRpP9qewaDzi18N9uaQ6pyPX
 Wx330m9u7XtzL2ROV5tLY3aZPGaRfVAGWDrGGA4o3UrUBpb/dRGQUMTV7fEueY1qggxZ
 5uZKa/ZsyHr/Ep9XKEbwTOL6mDR+Fg1jpcwF1jr6lnxLuz8L8gmx3gkbKLVq0oM5c2CV
 myM0J2CZlTgO8KdAnGCwJMnKVQqc/nvdXqeB0Wjw8x8gLXt1FIQGIAIQkJSkDZLrMNSm
 kcTb3ekLzB9/rIH0k6hl/GcDqPEkE2cgP6pgpX7JV2qVTamTvXxZJeCKxf0GJ4B9GHRB
 ZuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770815131; x=1771419931;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6AqLYWfpSFXOSvJwEf6e+C+LlA8G7GSh9PquU8bEgek=;
 b=UREBGiN/CM6NqgB6NRb+6emhPNhHL3eTU1i40ZOT/TsI9HvAGen3/yPJjwWuSjY3NV
 Ld7Apx2UH7RO0IAFyFXN9XM9w4iMZgsbyl1115SeTGxJk5JpgRdoKdk3mKJzi4IHTmkf
 uBXcwORErBZoUSObhFKCq+0SDiAQCXacMQUnd5eON8hHBduOFW0rM/7Ol9y6QgggFFKG
 N63o/vozx40FWzVLvSA/shipAQhRDzLnf0bft2SKeQ5civAH1oQkzAk/D2VDVwFrTDzy
 jTF//80hIfEGuPxPGH9bR5bmgscYACt8qV4//SiIP4toFKDuGaa9LT4qk0tBoJqGAWZc
 aACQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGAabWU9ftqQOWvCQ5a8HPViRtAL9l9D0e4kecPa+iJtI6EOjFkGUgfbGoKFeRLe4Wq4A=@lists.linux.it
X-Gm-Message-State: AOJu0YwJKVgySH/PtjQX2XV3NkFOuG3PbXVlzhY4D2mGyO00ycn44OyC
 NSHynd8ae/BFAMhsLata7QA3ee+tZ3W0n9pbWaGAngF9+jUFie/KHKVLphqYU9gu9Qk=
X-Gm-Gg: AZuq6aJvv1t65jSp0DYiOB6GqzDcdm/GHAz/WvKPz7SyyIjwWlUzxzH1uqR6r+V9pDf
 jgBO4eUKB5tZl+ORWnlWgPJ7Mo6CUlQjLZbjPWbSwQSwnCMol8+UKZsnjxtQKAs2JJ9cwEsFIqv
 BP/2U9mRbvF9vEyAFrv4/LATgE/JbywAZi73ZwlAQFmVt8eT9glVoIe9bKIsjKtDqb+YA7ss1DD
 nOOgmeyVSth5scdN49zFJDgNFZ8q+R/BTR+qHOqKDxFsba5RgIRQfdNgAi0bzcvJxXud1lzkq24
 4CWwWChCaWUs3Ulisk3xWneKeFM2zTwN1eFvLMj/VqZ9aEgkoXjrAZYPAAcoF2tnMc61+FalZN/
 yMDEsMjjq9x7DwMtco91UIkEuv9m2MkDIkZMV3pb5fmgiwJyzltx0S1TBHJH04r7KSqI/OqaatK
 /nmv6xjuw3BQGixnS3q7Zqb++9eDg=
X-Received: by 2002:a05:6000:220b:b0:436:4ba:59a8 with SMTP id
 ffacd0b85a97d-43779e3c22fmr9447006f8f.3.1770815130668; 
 Wed, 11 Feb 2026 05:05:30 -0800 (PST)
Received: from localhost ([37.162.249.193]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e3b829sm4646273f8f.27.2026.02.11.05.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 05:05:30 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 14:05:26 +0100
Message-Id: <DGC5KMP8J1V7.ALUWBN4R82H1@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260128080121.18878-1-pvorel@suse.cz>
In-Reply-To: <20260128080121.18878-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] doc/ground_rules: Add Kernel features check
 rules
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim]
X-Rspamd-Queue-Id: AFF8F124A2F
X-Rspamd-Action: no action

Hi!

Is this patch still valid? Should we merge it with minor details as
suggested?

Kind regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
