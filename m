Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMYmCcjhqGnzyAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 02:52:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A520A031
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 02:52:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772675527; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=tG8iI2bz8otxF9K+tjP1FFSAmkvcfmkkMmhVdP4U+5A=;
 b=D8b2NwdEQrGtMnGjQtrf43u/mIOD4SBdsYrnjEM9yxl6vto2vxN5l+bl8ZZc/e2PLb2Td
 IrgTdu9W/CeTPiHeY0sOz9yS7Tx9zGMW/p/JdTOuOPy93CgryYBmojqNi1WjdwIcxSFYFie
 H3TQLjYU2pRnNFlTcrfNuwNyKIxNk2w=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48C213CD1AF
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2026 02:52:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D96AD3C5DB1
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 02:51:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 586E310005FE
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 02:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772675511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y+acm3kD68D+7uQD/HX6k3vKg0rKE40HXuHFU1s0wMQ=;
 b=DNbOqlToCfl4QorkLHURFadcPPKIUFPc0yqUe+gi4i86F3+Ujxs6rJwNzdt/qRQ82IUJCa
 byH9E1jgIM9yQfph/nCTfySYAFMC3Dx/FiWJaTqMjQEkGURttk1aINzijIpBUxhiSoXmAS
 T2HdSuc5UrTYyz3xx/aY50Hwfdr9HJA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-LSqPo3aROw2Fdn4p5oz9SQ-1; Wed, 04 Mar 2026 20:51:49 -0500
X-MC-Unique: LSqPo3aROw2Fdn4p5oz9SQ-1
X-Mimecast-MFC-AGG-ID: LSqPo3aROw2Fdn4p5oz9SQ_1772675509
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae3badc00dso51479385ad.3
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 17:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772675508; x=1773280308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+acm3kD68D+7uQD/HX6k3vKg0rKE40HXuHFU1s0wMQ=;
 b=tOYswsZiJFxbP9qAXFShFNoKQN61p99XeclB+pH1IaqMvkwlX69VGzHtFHZwAwYGOZ
 nKYL2Ffi7PRXmPQl+/Jw7OgvS11by+NL+nEkUJ/lLOTd+3oglQrmMBSdt8mMQfVVyrUW
 cNoFSf1jY6HKQyPci+pqCcM5CdHH1IvfTxA3QAxfbNenFZge5b4Opm8JccU2rwq71k3Y
 ujMxfCEL5PkIvAlQCEuUVRyb9lxJpdKL1ujBaGfkeg8EO/2UMc7wEFkoPGUB6ew1VFqy
 OScg/TPuGlBB6btXs3yR4ewtXwpcd6dUNlxZhnbUJBPPYSfWUl7g9jJMUwMKfb7uQ7nf
 9r7w==
X-Gm-Message-State: AOJu0Yz+g76Nbmh5Orw9XPQm9Dvv7AGOaU9PRx1jzlWkzyN5DYikqPa5
 6YwnmmQBThIJ7MYfUOA5lNf5nXXbdENdEfDeG/5d7Ag3aUNe9sJxRPgPOf6AiL5T4UtIhy03nTa
 tfRen633I98n26hnO8loQlWaYjlFQL88XR6FMhU3Wp8FLFrKFJIXtGPwfTnnt
X-Gm-Gg: ATEYQzy858FQBU02uG+i9aSCzHFVz6h+pW2ezIjkmqaFXDqYvxLtBzeZhRAKdd0yH+i
 3aNbTHJb0DSnMadTfrgRFp+7ttWwteIED2VuJz759ZDrVX4r+zd7mbjHhJ5FNSjITHBBKIZM6U/
 2ijs3Etq4/nqotNHetya6OgwpIVjywQn3vyfmO82gZ1CfvLssIpvc5/exYmzvkVTMOzQxjdWDXY
 p1DkAYZGF1kdDriYAvcUt5SASGhGxs5Nlg0WgX2jyRRlA1BJVyXaX8erU/DzreRtGjKJr9CkVNL
 s9BHb8TQZ9RI94QV1pfyYiTSGgNQBj/at/IGOfR1AZdtefkeUknenssQzzz4s/SA8OzXKZX2+7U
 DZuUpSl++CaOPkF8L
X-Received: by 2002:a17:903:185:b0:2ae:5598:1db5 with SMTP id
 d9443c01a7336-2ae6abb21dbmr40728285ad.50.1772675508187; 
 Wed, 04 Mar 2026 17:51:48 -0800 (PST)
X-Received: by 2002:a17:903:185:b0:2ae:5598:1db5 with SMTP id
 d9443c01a7336-2ae6abb21dbmr40728015ad.50.1772675507761; 
 Wed, 04 Mar 2026 17:51:47 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69fa65sm206703035ad.58.2026.03.04.17.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 17:51:47 -0800 (PST)
Date: Thu, 5 Mar 2026 09:51:45 +0800
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <aajhsZYkb9WqTho2@redhat.com>
References: <20260304161425.12461-1-chrubis@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20260304161425.12461-1-chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jNwdUIITxnIHqdMccKPWlvajlEZbHxn-rGYdvUdt1RA_1772675509
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls: newuname01: Convert to the new library.
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
X-Rspamd-Queue-Id: B38A520A031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com]
X-Rspamd-Action: no action

> + * Verify that uname() succeeds and correctly identifies the system as Linux.
> + * The rest of the values, when possible, are matched againts the strings from
                                                           ^ against

> -int main(int ac, char **av)
> -{
> -	struct utsname name;
> -	int lc;
> +	SAFE_FILE_SCANF("/proc/sys/kernel/hostname", "%1023[^\n]", proc_val);
> +	TST_EXP_EQ_STR(name->nodename, proc_val);
>  
> -	tst_parse_opts(ac, av, NULL, NULL);
> +	SAFE_FILE_SCANF("/proc/sys/kernel/osrelease", "%1023[^\n]", proc_val);
> +	TST_EXP_EQ_STR(name->release, proc_val);
>  
> -	setup();
> +	SAFE_FILE_SCANF("/proc/sys/kernel/version", "%1023[^\n]", proc_val);
> +	TST_EXP_EQ_STR(name->version, proc_val);

We'd better clear proc_val between reads:

  proc_val[0] = '\0';


Otherwise looks good:

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
