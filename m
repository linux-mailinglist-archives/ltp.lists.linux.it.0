Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAjCMsmqb2lUEwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jan 2026 17:18:17 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 714024745C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jan 2026 17:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1768914839; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=fK+YhSclyixKjiHVSwmor/5vaBpmmZPlFW692ms80Lg=;
 b=XbGU4CN5WykvuTzR9Fy0KUqIO76zuju6fx8nikFVFZhcZY4PY9FZdfV6yfQQy+9rs459j
 gWTCG4W92rewEu+BNCuPm8FV8g7G6r/X3/RfhgxZOsbgynpNwT5RSvp4EknKwsIIdb8bIGG
 Vs5RAW2rAawSmsAhyOUMNDsZz+kwbTE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 585043CB038
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jan 2026 14:13:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF39A3C5A8C
 for <ltp@lists.linux.it>; Tue, 20 Jan 2026 14:13:45 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 540601A00A3B
 for <ltp@lists.linux.it>; Tue, 20 Jan 2026 14:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768914822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RR65A5i6PlTI+Ve5+yNwdE+GhAm6h812sdSoxAj8CJ0=;
 b=Im8IUKZ+yyym7skjbihBplg4gmi0EEToVG3v9XuZJ2kZbUmKjFOHFiYrT9dVB3kqTYvyru
 3wWurJlDpEhSGJ7/a7Zhws0lui7ZdP0aV8m0QnkCiL2386XxMtaR+A5SuEe1z9tL/mWP2u
 bfwreJUix5qAkZjlL8KsHLFj9uh7OTs=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-GBmnsiPFPQWM2Pk2bvb07Q-1; Tue, 20 Jan 2026 08:13:39 -0500
X-MC-Unique: GBmnsiPFPQWM2Pk2bvb07Q-1
X-Mimecast-MFC-AGG-ID: GBmnsiPFPQWM2Pk2bvb07Q_1768914818
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2ac363a9465so6032316eec.0
 for <ltp@lists.linux.it>; Tue, 20 Jan 2026 05:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768914818; x=1769519618;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RR65A5i6PlTI+Ve5+yNwdE+GhAm6h812sdSoxAj8CJ0=;
 b=blhEGU9aHOI49nDhl4ITNo3s9ufpC0UZHtxBARVWUflG/gjdbCWNAGL7KR28OslDiG
 hsYFAAg4it+UjEKzxXuEeS+5IBTfuxWB9nPGVw9pMVhS9EhvqEH+ZKm4P1iOXD2MtOWy
 Bfoc1MrWh4/6163TBgBPYqVnVSpTLRvHK+fVQhp05xvxojhllZutI2wpp0K0mMwGjTcH
 Lsbm9jG7jCGeD/h+XUF0z1t6mTFFcBz5HpWGl1fRX8Fdfg+DcjRHcdHlPGblu7D+wrDM
 3pCj8imlRncvSlI/Zx0DNpF92xidJnibiTG614EgsYFnrTMUFY979nVvcHHZlq84xeBL
 UbRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOHXtcCfS3QmsaZ1s3RD/G4uPacRYeJOwyvAUL5A/OemH21hBIbQ5kzTWrrIWfDp9li5k=@lists.linux.it
X-Gm-Message-State: AOJu0YzCe4tKrg7ctGbqdrikLXDbgyQJ1+XQFck4Y+JdhQgshQkdQjCz
 hrZy6ikJlT052gcVVEkDzaufKLww+NP03T59zrT2PAV1H4+inwikyigDDf55RbqfQ8PWjKM5HgZ
 HYTwEi6jOz82B9aM17nxNdlUEAUGOaQ/pxywiVf/GL87BPW5DhLdyyO1gMzFOXL4lzG1DB7hNMM
 lPpcQPDughXHeaZ204zwyz2L9FPyI=
X-Gm-Gg: AZuq6aJ1ulm0ia5m51aHKVCmcYV++lSi1VXG2v7FnWI5ZwTzDu/Shwcz34k5IRKpExb
 uVKlGruZUo7DNX8wlSHqRrHhYgvP537vS3RY0YWZRUM84bBKdUDy2F+mWH1N1DP3ADpcgOyCfih
 KJzyutn7UheJecJNKNY2A195OgM0GA2nQQjEL2qYzoPGni/IR8HNIWi0Na8/3+MxNJK90=
X-Received: by 2002:a05:7301:678f:b0:2b0:4fe2:6a2e with SMTP id
 5a478bee46e88-2b6b3f05fd8mr12587705eec.9.1768914818110; 
 Tue, 20 Jan 2026 05:13:38 -0800 (PST)
X-Received: by 2002:a05:7301:678f:b0:2b0:4fe2:6a2e with SMTP id
 5a478bee46e88-2b6b3f05fd8mr12587688eec.9.1768914817720; Tue, 20 Jan 2026
 05:13:37 -0800 (PST)
MIME-Version: 1.0
References: <aWmqFAzdtsR0t5aJ@autotest-wegao.qe.prg2.suse.org>
 <20260116070708.GA556902@pevik>
In-Reply-To: <20260116070708.GA556902@pevik>
Date: Tue, 20 Jan 2026 21:13:25 +0800
X-Gm-Features: AZwV_QhsstRgNBm9GjJUAaDHOH24_FdhUeVbtIg4rcg1Gtv6Clf8Fu6AXxjGxL8
Message-ID: <CAEemH2foRNfQZt2mFRdR364=xB8db_qjd36pM_ce+EKpJOAhkg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jQbHeKH_l1v_GzDBREXjqOZvzJ8ZB4zM88-wlaKNO-g_1768914818
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] clone10.c failed on 32bit compilation
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,picard.linux.it:rdns,picard.linux.it:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 714024745C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Petr Vorel <pvorel@suse.cz> wrote:

> FYI the patch is invalid. It should have been:
>
> diff --git include/lapi/tls.h include/lapi/tls.h
> index a067872e0f..eee77899e8 100644
> --- include/lapi/tls.h
> +++ include/lapi/tls.h
> @@ -64,7 +64,7 @@ static inline void init_tls(void)
>         tls_ptr = allocate_tls_area();
>         tls_desc = SAFE_MALLOC(sizeof(*tls_desc));
>         memset(tls_desc, 0, sizeof(*tls_desc));
> -       tls_desc->entry_number = -1;
> +       tls_desc->entry_number = 13;
>         tls_desc->base_addr = (unsigned long)tls_ptr;
>         tls_desc->limit = TLS_SIZE;
>         tls_desc->seg_32bit = 1;
> @@ -72,7 +72,7 @@ static inline void init_tls(void)
>         tls_desc->read_exec_only = 0;
>         tls_desc->limit_in_pages = 0;
>         tls_desc->seg_not_present = 0;
> -       tls_desc->useable = 1;
> +       tls_ptr = tls_desc;

@Wei, @Petr, did you get it to work after trying the above diff?
Which kernel did you use?

Unfortunately, neither of these methods (including Wei's method) works
properly on my kernel-6.19.0-rc2 platform.

And no matter what method I try, the child process still cannot switch
to the new TLS. More details see I posted in the pre-thread.


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
