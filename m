Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m2J7CZfBlWl7UgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:41:43 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5898156C9B
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771422102; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=jFviNCl3mVqHEuOb5bdJZSojk16VzJ3JZu8suEh5PV4=;
 b=S7ztM7FuL5N3BU/RlBmIBFrQHN/IaGKPO3rcoapI0MzOjlvVadlo8CLDgN8M4paz2t2uk
 xRuswk0hu2idA1pFe/9DjeCaCCWqNryC0pcHhSwMsFKpxCYKMwwcrmBhAlnlHYihhZu4O5L
 wInQ3IYYfVffT80qMkXPMFz0HagzGjA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 597C53D06FA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:41:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 176853CB3F4
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 14:41:40 +0100 (CET)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 54414200758
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 14:41:36 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so49163185e9.1
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 05:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771422096; x=1772026896; darn=lists.linux.it;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mX0ea5RWrVePWQsJoHCAtKYwKpNswCimslCZZkfjMBc=;
 b=J8JusVjxaBCAcPS0/HpBTetIpH6WjW2UeHbFQg6BqAmDsJ0HvYFai+UCjNwLm+Gqbq
 UzbZt1E0bWuN65GSfLkj4xBh48LinvVXxyPu4fmr29I7x2aLeCvh6syIGUlDbBgegJQN
 KWkx6JNMgOCxwNmCtYJQNSjFc/YlU97/yjWMPUsYl6/yGvgk7XC+xVMidLEAzdfB+l7u
 UGp0LiVJ/FpMLAv2CqCgVhsCCFUFbrt7/X85uCW1P+0oyikeqwtlq9DwgUM35gEeLhpb
 APCAgJMy4BbQu9YKlrnct04zONmitNsLT1paMHd4CrWKf79m6na2eGdpe2tLtsjgxvUe
 HHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771422096; x=1772026896;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mX0ea5RWrVePWQsJoHCAtKYwKpNswCimslCZZkfjMBc=;
 b=FVx61rk46EnG85LSLx2eMyt6K9uV66q8k06zTuW+FGIWJ6/xqNqgTG5eH1JYV3E3iY
 afpnmq8TT1HKeSLHBwc3zWQYO3n21JD8aEXtN5lK0GRGiAMCF/mt8GFWe4jkU8DMiazG
 k0sRRj1h3C0T4zEPJMDQgjey0ENmfvmTFZtlUuTegopUy9UAt+OtQ4LyIdVR1LlgSntZ
 +chl/fK3WIpcQ73sCjEmfcwwRh9d/x1cPIfswZEXPW1orkQNCMrdI30PlU7mwskGEqUs
 zDdpmH2UYrpiQQ2HK63mMjIcSK1hYrc2ZTUtIWdVkiCdEYtpancjHTYZslUF69wivNiX
 FF0A==
X-Gm-Message-State: AOJu0Yz1LEjARcRaBvfSjtdYPEDExv1920Fp9WFO1xif5j/CUt6UT6Xr
 EMPl/VxSgK4QdIMZEYhNaJe5oO/oHEuA7GGEViYnBRGgrJqeldA6RbcF6Er4q8fKcEM=
X-Gm-Gg: AZuq6aLO+6u6YZr3uqefI02DsPi4pX0S/BYN7HAlKTERXIPhGzouyXF5jsEo167+8Vg
 2OPBAJjUAhq4t2xgiO8N4LofX/mle8wtMIFQaU5quh8ZiVhhbSC+YwGFLzzmBZrIu+okNGAkq+C
 v8yJaFqSfk9jiYCA+STgURMIHYa+QQSbSjhsUDUIn/mxY0yKLOvJ+oOAWakYXJCVe8P4KReyllL
 j2vdGomzH5Uk7fjdqLMmaY4FFOXPjgkpmY8BGrb/3XN0scQeHLJwgIpRLhCg/LGkgoi6sOHdZfH
 8t02ehCngdoPcIAEIMPB+qUi3O39HDqYcaCixRcGLUitc4RFliwQBJ48+/p15Ah5fO1Tb5WQuHa
 dRDNesJpjFM6DKg7TQG3gWNw4Htkb/q7JDH8R2xH8DC3rcAzKokW8fmXbUD8EylF9hWX2m54lX5
 tMN5F2ORtjl0hYT9KeR6gqgBZUub5PQuTpeJMYhf4yolPFR+XtywukfiZH/4mEDu/8cp+5b/Xdj
 kSlSlc5zEPUWppyEWE=
X-Received: by 2002:a05:600c:6992:b0:477:9eb8:97d2 with SMTP id
 5b1f17b1804b1-48398a4978cmr26125965e9.8.1771422095620; 
 Wed, 18 Feb 2026 05:41:35 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483983b7bb7sm34451965e9.4.2026.02.18.05.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 05:41:35 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 18 Feb 2026 14:41:34 +0100
Message-Id: <DGI4Q3T70R5J.27XFN77L0MND8@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, "Li Wang" <liwang@redhat.com>
X-Mailer: aerc 0.18.2
References: <20260202091801.68673-1-liwang@redhat.com>
 <20260202101430.GA24157@pevik>
In-Reply-To: <20260202101430.GA24157@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] doc/developers: document tst_/tse_/tso_ library
 namespaces
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
Cc: ltp@lists.linux.it
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
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url]
X-Rspamd-Queue-Id: B5898156C9B
X-Rspamd-Action: no action

Hi!

On Mon Feb 2, 2026 at 11:14 AM CET, Petr Vorel wrote:
> Hi Li,
>
> > This helps contributors choose the correct layer when adding new library
> > code and clarifies expectations around legacy components.
>
> > Follow-up: eef750db28 ("libs: adopt tse_ prefix for extended (non-core) library")
> > Follow-up: 751df4fa64 ("include/old: rename legacy headers to tso_* namespace")
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  doc/developers/ltp_library.rst | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
>
> > diff --git a/doc/developers/ltp_library.rst b/doc/developers/ltp_library.rst
> > index f76cbb75e..bb2677622 100644
> > --- a/doc/developers/ltp_library.rst
> > +++ b/doc/developers/ltp_library.rst
> > @@ -15,6 +15,34 @@ for :doc:`writing tests <../developers/writing_tests>`
> >  #. Do not add new API functions to the old API. Add new functions to
> >     ``tst_.[ch]`` files.
>
> > +Library naming and scope
> > +------------------------
> > +
> > +To keep the library API easy to navigate and to make layering explicit, LTP
> > +library components follow these naming rules:
> > +
> > +- **tst_**: Core LTP library API (located in ``lib/``).
> nit: maybe also use :master: for lib/ to make it clickable?
> > +
> > +  - Stable, widely used interfaces intended for general consumption by tests.
> > +  - New public APIs should normally live here (in ``tst_*.h`` / ``tst_*.c``).
> > +
> > +- **tse_**: Non-core / extended library code (located in ``libs/``).
> nit: and here as well?
>
> > +
> > +  - Optional or specialized helpers that are not part of the core API.
> > +  - May have narrower scope or fewer stability guarantees than ``tst_``.
> > +  - Can be promoted to ``tst_`` later if it becomes broadly useful and stable.
> > +
> > +- **tso_**: Legacy / old library code.
> > +
> > +  - Kept for backward compatibility.
> > +  - No new features should be added; only minimal fixes are acceptable (e.g. build fixes, correctness fixes, security fixes).
> very nit: maybe split long line?
>
> > +  - New code should not depend on ``tso_`` unless strictly necessary.
> > +
> > +**Notes:**
>
> nit: I'd prefer the standard note (can be changed before merge):
>
> .. note::
>
> > +
> > +- Prefer adding new code to ``tst_`` or ``tse_``; avoid introducing new ``tso_`` components.
> > +- When adding a new public interface, document where it belongs (``tst_`` vs ``tse_``) and why.
>
> LGTM, but I'd prefer more developers acked it.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Kind regards,
> Petr

With Petr suggestions,

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
