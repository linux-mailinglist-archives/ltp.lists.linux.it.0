Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJlWCIAccmnrbwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:48:00 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1800366D09
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:47:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769086074; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=NK8nKIohhjzU9xtiu5pvNi2WjDMV6m2oP5POxme6cSM=;
 b=h8sqF4CgNy+UaW8VKxqCGQ7plPZELENiCykrBll+/ANjnnxqO/gSfbBjn4CzisRPBgyOb
 F8eC/qxdo43rgLvJeTy/yau1HWezhXW4K6Aq8cfFMX8yWHb/04aFbl8mo038mkauESLCa7q
 lu+j9ElcxCr8bJE8ytXz3QSAndJgjVE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE4FF3CB52C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:47:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E7303CB49F
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:47:50 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F345D600A3F
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769086068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kImMk1pKXqsU47IVXKYxGOVrg8PHkXQj64Fq8jZGSgM=;
 b=a6cxTYaqp3XlzHeKtMG3xnj66st5HFM3y/ncXbsbmgcPtataZFg5nCXPo8j3j7n2/171tB
 IMirQ4FLSEteWI3r4zOlMketL9/8QmNheSTlYq/86tDmKDI+sTuDZi9l3y9jcVmAyRA6cY
 H/4qCfYnU3ZpJSneArnJgU5JHfz5eyE=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-NOBjlAmoPLCtbrW4Xc4-Dw-1; Thu, 22 Jan 2026 07:47:47 -0500
X-MC-Unique: NOBjlAmoPLCtbrW4Xc4-Dw-1
X-Mimecast-MFC-AGG-ID: NOBjlAmoPLCtbrW4Xc4-Dw_1769086066
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b6b9c1249fso1669914eec.1
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 04:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769086066; x=1769690866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kImMk1pKXqsU47IVXKYxGOVrg8PHkXQj64Fq8jZGSgM=;
 b=V+U5T/YcrvQNb5AZPRX/a5NhJ1oX/MQqB3z0L3UbM9W71UF5AQ2+CHzdiguk3H4Dhl
 /ZCSZY6/L/MAYXzTzueNcTclOoF26uSAOW1R623vg9/l/LbZhzuBe2WToBO3gN/RvIAr
 zC/iiPeqtzo2VU1QBBdbvy6QXAm4YM/W5j7+ZRDYNafI78E5R6I0A2omDz6MeaQSN1ky
 xmtMzOSZPJqMAkHSIWJp5KhmQUQckmJ70fq0hp+FTBV3zRsyTKm7dXINAeWhxrVZ+8Nb
 yELRygpDe8hY8d+zSCAHqQYpfDq1PV1EHl7vSl/Y2/mKAcOKbbR2BfBtbD66AZR/8Thd
 ZkRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7yM079kp/0EVJFiz2D8jEOnPR9puLWzzoCV7WI7pSWtAgirBu5Ci4OX8S+idUMvFMI8Q=@lists.linux.it
X-Gm-Message-State: AOJu0YwJbffVIC6BaZVqa0eWi1Wn5NmRdnzf9OugjAoLo5S58tqx1d8R
 JUN5bfT1s78FcIgwvG08mbOsTOPlarf99i7U4X7+N/T8qnNF8AavAg7CujMpaKBmN7an3NBfsTZ
 /yPa7UJYc2sr6dp5UpPjuxcZPfDVEQbacRLlmV3SdRIuGahs6Ke6bfztml8oFteKFnx5tcuTygV
 L+IwaeCsiXIFGrcx8EKDmsamnBuejFcI28ThqvNg==
X-Gm-Gg: AZuq6aJw9nkpupMZhvVepNZCZjI4En0ZHeWtlqbWR3Rjl5ReUwv0sdBjl+OoUYbX3Xl
 MbDAqHus63eJ9wc0GAs+dMjtk7Ql+5OiIyWg4+fAv05Y9l0+9gxp+dy5PX4nThiJaifBvvfwD4A
 j5zJpzgyl15DnsUfm3frCirPBu0aFUHtdPXMe1wG/9+SdE7UJlBH5DnBHp33ziicJV5yo=
X-Received: by 2002:a05:7301:e06:b0:2ae:5dc2:3b11 with SMTP id
 5a478bee46e88-2b6b46d3163mr16816773eec.2.1769086065848; 
 Thu, 22 Jan 2026 04:47:45 -0800 (PST)
X-Received: by 2002:a05:7301:e06:b0:2ae:5dc2:3b11 with SMTP id
 5a478bee46e88-2b6b46d3163mr16816764eec.2.1769086065456; Thu, 22 Jan 2026
 04:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20260122102606.87754-1-liwang@redhat.com>
 <CAASaF6w3S2STiyS9LvOsK_uVEvRoO6uq=XNMG-cMNheC0k1RHg@mail.gmail.com>
 <20260122123154.GC64562@pevik>
In-Reply-To: <20260122123154.GC64562@pevik>
Date: Thu, 22 Jan 2026 20:47:33 +0800
X-Gm-Features: AZwV_QhMS-36UkGmCgVFIMfD3VKw-argbudOY8xa3o115NTrxLfHEwU1Qz5GD60
Message-ID: <CAEemH2c8+X85Ac-oPtsOND=OW=YHvx1R_TNctTThfskKhgOP9Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rxEmcwI84JJd3EGSbYOJzYuUP65HnZQkXDqHSLjDPqU_1769086066
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] clone10: add support archs
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MSBL_EBL_FAIL(0.00)[jstancek@redhat.com:query timed out];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.it:url,suse.cz:email,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 1800366D09
X-Rspamd-Action: no action

Petr Vorel <pvorel@suse.cz> wrote:

> > Acked-by: Jan Stancek <jstancek@redhat.com>
>
> LGTM. Indeed only these 3 archs don't TCONF.
> Acked-by: Petr Vorel <pvorel@suse.cz>
>
> Out of curiosity, where is the support defined in kernel?
> "if (clone_flags & CLONE_SETTLS)" is in many archs:

Not based on this, the clone10.c test was written and gets tested
only on the known archs (x86_64, s390x, aarch64) by now.

And in case that other archs (not tested) have different behavior like i386,
so we are limited to the know/tested archs.

If we can get another arch to verified we can add it to the
.supported_archs as well.

$ cat -n ltp/include/lapi/tls.h
    ...
    53 static inline void init_tls(void)
    54 {
    55     #if defined(__x86_64__) || defined(__aarch64__) || defined(__s390x__)
    56     tls_ptr = allocate_tls_area();
    57 #else
    ...


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
