Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMS5DDuAqmlhSgEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 08:20:27 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE621C5B7
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 08:20:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18F783CE96F
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2026 08:20:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68F283C18B3
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 08:20:17 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DAEB1601436
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 08:20:16 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id
 98e67ed59e1d1-359894e17b8so3700981a91.1
 for <ltp@lists.linux.it>; Thu, 05 Mar 2026 23:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772781615; x=1773386415; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hmdPZy62EHpI2RdOTAhaiH6cvAh9wBP3yBlRVoWkH4M=;
 b=LJA+l7Aa2FDMiBZh7XbezRa0t+iF3Gjs0sBfJGjDYqZ15k+5GDv2Gm84akWQJRD658
 UL08v/RLTOATsZbzBs5K9GxK0xtHm7/nJd66cfF42cqlYAv+KH8SUXNd7oMKFfecYIrH
 /QIrFK4o6Tnx4+qmPFI8zK/lpX2QDgEJ25xlxNgIlNoz5Nk/D7CDcdXfcfIoAhoX+Bof
 hHQNEMwqHC1r5r9NuD7k6Mji6NNprQO7GEqh9M9bmaabOvz5m6laAzDhsdpuUINFMRCm
 Qa3H6sdFsMgBOAOoD89NyWpwfzocLJI7Ik4E6QCnVyvTQ0HbIfdpp+UvN8H4OGCmTTlK
 V1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772781615; x=1773386415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hmdPZy62EHpI2RdOTAhaiH6cvAh9wBP3yBlRVoWkH4M=;
 b=olnHwwp3sjxbcClhW6E4ou/INvV1pKKhcfs5bSJPE6C4NpiWAjzYeX5uEUgUj9mmpL
 g78u9TyGI3DJoDb4GVvROYTNzncfJqlJzcXsNQzGQEo3/j26gDeXgHew1GGTJFfl3H+u
 zsXp7qez9U5AjupNo7Tmsxm524/jTABhDt0ayCEEOPXSNu+RYH/Qq9jstQ6yxvxH6haJ
 S5WDcy0J8mYf695+J7B8hCgNLRTW7if7dYdRua+l/S+H5mc60WFHw8++Pm6DW6o+8+Kh
 3+hYcHfKeSfidZm9ROl1ud/neEPH8ziKyiAiGb8Eujtr72Wlhl1BHyqpo9xyHs/vyKn5
 TU/A==
X-Gm-Message-State: AOJu0YyHdo4KG6REzis3+HPPXajcbdkN23Eiv7ZbwQ6FTfNplXD6kTnm
 +D16keAXcObfmyhHi8ghbMy6QJvFKaXc60Jkhia6+k27gEon2BvCt+HW3iYBbLo=
X-Gm-Gg: ATEYQzy0l0zTbXoWCkHvzxE4C0e8jWz8lyuS7vdNbqdTe7U4U9yECUcXQk/fJ9OczA2
 EfrVqwcFShkvggqwTmMANYnc6bKyo5ILxD4kZETmxLHdugB1udT2+fefmQbsAQsJkBYCfK1ix+r
 l5W40RfSm3qmgvOU6jLUvab1CtZQhmKUwGy6kHNr51pzd0hXk/APNqbZRiluE/OiyUW1iuEgpGi
 wrwT5tViryL3Bu1u7e233Jb4iyv823Lco7yD6zvrNLfa2GDsWsiIO0Sj7E0iIwAm5l+5HF8XaHi
 Tcgg33bqKz36wk6Jgni1dOthJHzDOeI3ywKXI4lJNm1ORP4gopRjgGhcMJ0xle8h4wOJY79ZNT4
 uaBBB+BZVDewKxTcOMDV92jZQ0vyqYbePysk+5+ceGAhMT5msC4oYicpto5HWGLm/6QgGeqBFYM
 zMeB8jv3kn9+iRMIPWBA==
X-Received: by 2002:a17:90b:5544:b0:354:bfb7:db0c with SMTP id
 98e67ed59e1d1-359be2ecb6cmr1126214a91.22.1772781614946; 
 Thu, 05 Mar 2026 23:20:14 -0800 (PST)
Received: from JS.lan ([171.3.84.26]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359c003c51bsm875704a91.1.2026.03.05.23.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 23:20:14 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it,
	andrea.cervesato@suse.com
Date: Fri,  6 Mar 2026 16:20:06 +0900
Message-ID: <20260306072008.3111-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <69a70250.050a0220.3bc433.165d@mx.google.com>
References: <69a70250.050a0220.3bc433.165d@mx.google.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] inotify: clean up build and make check findings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: C9BE621C5B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.377];
	TAGGED_RCPT(0.00)[linux-ltp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url]
X-Rspamd-Action: no action

Hi!

Thanks for the review.

For the -Wformat-truncation warning in inotify02.c, how about fixing it
by adjusting the snprintf() call?

For example:
  snprintf(fname3, BUF_SIZE, "%s.rename2", fname1);
  snprintf(fname3, BUF_SIZE, "%.*s.rename2", (int)(BUF_SIZE -
                                            sizeof(".rename2")), fname1);

Also, regarding the make check warning about ENOSYS: if I revert the code,
the warning will remain. Should this just be left as-is, or is there
another way to handle it?

  inotify.h:36: WARNING: ENOSYS means 'invalid syscall nr' and nothing else

Thanks,
Jinseok.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
