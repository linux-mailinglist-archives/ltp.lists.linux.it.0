Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN57AaT7cWmvZwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:27:48 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1F653F5
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769077667; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=gwYLE2wyYZZxsIYtv86CP6haeDoYEZotppikQb1m1Ak=;
 b=UHjqFpRQn2pDKW5zLIM0alRhp3C7dti/ksLEQEqHXQGbATydZgCBukJSmfxWvZ+2Wfx5L
 YHuVjHtjExXSJjk9fRgCam4iZKzjx3QsnC/k/GvCaSe43NRVEJLFFYrd1mcu6Q7J+dHFJ7q
 thNaxLWWz2hcfoW6eIF3JfWEEvkhzuA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58A293CAFD9
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:27:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D33B93CAFD9
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:27:34 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3F0DA1A0021D
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769077652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hT1t9uypUioHtFwWSHpdn4b1e5ZIJXESTsnt3WYdVis=;
 b=PiqzVIOe0uxHMEdHvbm4V16MFVYv1h8LvLq3mXMnJoGZcU3zE8Q4ec6yaHlP9gzFKb3Lsl
 8eVs/9jpiLH48PeYwzmlFS4UM5sdmeJy5mDi+w10+hD6IREY/JXo+cD57HNOh/1sgweqYY
 0kFdlwuWLuFq6La959wzV6Ous9xZ7Ig=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-hKym8PI5OiaUYTjUsQqXrw-1; Thu, 22 Jan 2026 05:27:30 -0500
X-MC-Unique: hKym8PI5OiaUYTjUsQqXrw-1
X-Mimecast-MFC-AGG-ID: hKym8PI5OiaUYTjUsQqXrw_1769077650
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b7155ca88cso632473eec.1
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 02:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769077649; x=1769682449;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hT1t9uypUioHtFwWSHpdn4b1e5ZIJXESTsnt3WYdVis=;
 b=UF7ktFWQXlyTPn1nWBF8jMb/fanrR7xJqb9tP5wPwX5K9CAEFUof+AMInRMMfoGrpp
 t0ROU08GBBAGAZmDYPF4BEC3y2+ZuWY4WqLG6FHRyYZlouXIVzK5DBRG7iE8GraicAez
 Ltwy0IXy62fM/7addl800LMwdxwdoE6DFmiEoaGdq7SWbXr5IUk3wIbXyHFxckNgx815
 PacOhpH0pwSl7odr8kq3sFUQrhFyBKC3lqLdaBPgiui0Z24M1M9tY0q1jKzpduniTLKt
 nPMvhleI7WwsEs3SZhHNBd1rc+7iCNelp0Dxl00YQFccmtOEOqtVwTl/At7JfFwddFzi
 QP9A==
X-Gm-Message-State: AOJu0YxqaOmgRz4t1J2p4mp3cURizvEoZadMeIodRZsjHc4JR9t4P2lN
 VwSRzHVg87WKK3QwAAB51pb+nKl31mReUb+buNYHMrjjyIG/QcLHW0wh98LMak94be+5aM4zOXj
 1pPzhpA6qwvROfnF59PakDnWkYuGwdtxFXCW/QbuCKNsgFkhfM2ICNEPezAzkw5M8iereb3FXCM
 Nr+EllpHDuQAVXjDwfbDu2ARvQCMnr0mZKOkE=
X-Gm-Gg: AZuq6aKbJN+SkPIk0LlARUKcdki54waluBKOjv8ZRmRoy1lwKcLQ9L5v/vmG0afPlzn
 ZFeU6YXMmnxe6F3pB1hlhCadfl0YxiJAazXh5kB8TkpGnhdck2VwkaxhiT8ElcFr3X0MCBdgZcX
 dY2/u84WKkbAJOIcmIrLTgIAw1Vne1xOEJRDppK4nRJWPXtGSwKQ8dimJufwKNO6NT0FY=
X-Received: by 2002:a05:7300:a887:b0:2ae:5ad4:718d with SMTP id
 5a478bee46e88-2b6fd7c5914mr5164580eec.43.1769077649193; 
 Thu, 22 Jan 2026 02:27:29 -0800 (PST)
X-Received: by 2002:a05:7300:a887:b0:2ae:5ad4:718d with SMTP id
 5a478bee46e88-2b6fd7c5914mr5164568eec.43.1769077648795; Thu, 22 Jan 2026
 02:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20260121090159.32686-1-liwang@redhat.com>
 <aXDVaT__f-LssTf0@yuki.lan>
 <CAEemH2e6ohk7f2L=N+=ebDStcn34js9g=YfejD2irJ97tSnjRg@mail.gmail.com>
 <aXH4sUnkk376H0ID@yuki.lan>
In-Reply-To: <aXH4sUnkk376H0ID@yuki.lan>
Date: Thu, 22 Jan 2026 18:27:17 +0800
X-Gm-Features: AZwV_Qg9MPyOnsuA8id2D_ROjbL-cRfqnhb0UsaiOHirncHeIcP3DnSWnKAn0GA
Message-ID: <CAEemH2efwWZ-tOr4rBOXjq8YfTxVX=owZppy-bQW=pVsSJXDHA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mFQhKMni3YS7vLZIbNWtLeCUKeUNterUmsO67L8o8mk_1769077650
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lapi/tls: remove the TLS support from i386
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
X-Rspamd-Server: lfdr
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
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,mail.gmail.com:mid,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: A2E1F653F5
X-Rspamd-Action: no action

Cyril Hrubis <chrubis@suse.cz> wrote:

> > > Shouldn't we also set .supported_archs to x86_64 in clone10?
> >
> > Nope, the others archs also work (aarch64, s390x, etc).
>
> The the supported_archs should be set to:
>
> {"x86_64", "s390x", "aarch64", NULL}
>
> right?

Ah right, I have sent a new patch.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
