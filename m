Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDPPKXBjc2mivQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 13:02:56 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 516777583F
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 13:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769169776; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=IUHVdbGadFv26ZTW3QcqVjH0GJ3tpYrJ/HoxYCXahrc=;
 b=LTJoS6tGvuC1BVwsdqeUaHMp2Cgy9cKj5LgpNgD6x8a/7+v1A/h1lY141u4DKXQMH/jPb
 s6c8frys5RXp9zZoouCosgPSoBtKh9q4d+53qaasW4uV+rnBuA0D4tNriu8QgvQrwFlMmH5
 LFxYPu2SMMcyoYDZqGAgC/UX0fvje24=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 064BE3CB604
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 13:02:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A174E3CB5C9
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 13:02:53 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 01182200D05
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 13:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769169771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/x8DCnW/xm5/iO1uGKHgsuWfZGcfplq/B9g5UKmCqFI=;
 b=CLNjAkTUQrR68Y4mmrGTQ1Bxo7W+4NN+X5l8nMQbctL3CSstHHl6pLnV2tKIEA+phbqTPD
 M3IH3xmncG0ZDr1//a8Sr4MY/hU8E5YPx/wKubuOjqOMMgBcMLwvNfQmDibyVg/U6cGTMk
 APWwW5snT869KebtrEhespsRt4lLkxA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-nfY75YthOUKvdcb4vvxpcQ-1; Fri, 23 Jan 2026 07:02:47 -0500
X-MC-Unique: nfY75YthOUKvdcb4vvxpcQ-1
X-Mimecast-MFC-AGG-ID: nfY75YthOUKvdcb4vvxpcQ_1769169766
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b8709d4ff20so136142966b.0
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 04:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769169766; x=1769774566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/x8DCnW/xm5/iO1uGKHgsuWfZGcfplq/B9g5UKmCqFI=;
 b=TCBJgSbtytZo7Nc4YMlWvJuvEWKIq7B7Yn5vCobWwKq1c5p/AiKq+js8QjqOTRpjb2
 JKdyck+j16Ir/OHFW64hFU8edMLgk+LJQZQcTJNINmGuAmfP82bGB84/LgJFZe+RJ+hQ
 E4XYmD8f7RYLXLCs3M8LuZuGhYt4Zg7gTnIhd3TEKuwMJghhpYqniUGr4veGDtJxN8fO
 EA+3I2ZU/JwRIvDZX/df3jRMu83lttVI8cx2z04aWJNRhBjFfmDfFVbWYpY2oNluHhvS
 N4cndXcekej4opVvV5X00Ej5Rf+jcjtviClyp/VYoVTtGYgMo/nerHD8+U4gmb/l6kXJ
 d/5g==
X-Gm-Message-State: AOJu0YysT5RD3KLYnkNS6c0C5QAP1z+uaJW1x1SxECa6qiJfWUZl7sPQ
 5ubELUzPYqZ5QZhImEoZC5d+W3br0b2F0Z/wczOIFfxn4xya9yEFsDYItl0WtirHr2nSGB53I3R
 ofoLkhW6uuePjEeLdhvBZ7DyTIwncWfOeYObWC+ByRlz2zCYN0VjeoFKcMcfuW8bDrwWmddLOCJ
 b9sp6mTIqLUciH5NB0vXXCzlnQFDI=
X-Gm-Gg: AZuq6aKiVlP7OM5y5HCwmDHw1i1TCkeIzLPJTMtSQR7zaypCRytR0VSuYFXVVKM5sRg
 BhNzXVjWYvu8+H/lcbE5Dos/0U7854BMfmYR1zA5fMzbOGpb6otzrEY3Uz2a1z7duUMGA6pf+Er
 5hUqrhQZIUP6VrIygS6WWvUGEVTTflM+UQze8AZQLiBwFhHH/3l13o8/w5F/qYKBALFnw=
X-Received: by 2002:a17:907:3f21:b0:b87:1d30:7e6 with SMTP id
 a640c23a62f3a-b885ac2ed61mr168282966b.11.1769169766245; 
 Fri, 23 Jan 2026 04:02:46 -0800 (PST)
X-Received: by 2002:a17:907:3f21:b0:b87:1d30:7e6 with SMTP id
 a640c23a62f3a-b885ac2ed61mr168277666b.11.1769169765758; Fri, 23 Jan 2026
 04:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20260123054056.131992-1-liwang@redhat.com>
 <20260123094538.GA113458@pevik>
 <CAEemH2c2pzwLcr+70_67oQ4aTqsTE004MnrLEPZgfvk-G1B+pg@mail.gmail.com>
 <20260123115317.GA117991@pevik>
In-Reply-To: <20260123115317.GA117991@pevik>
Date: Fri, 23 Jan 2026 20:02:32 +0800
X-Gm-Features: AZwV_QhqiaTDSf1S44ke869mOykbDMS2SZOKe0AbUlwSWAEAiAGFFowwurpZoZg
Message-ID: <CAEemH2dUZcuX7PoXGM2OgdB7O9F=ctoYjcWpLDA7tGxHYJqp3g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a7RLkSteDZaIP7Q22uqbBeWHNAUyvfj76sYATq9AcWI_1769169766
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] userfaultfd05: handle kernels rejecting WP
 feature in UFFDIO_API
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
Cc: Ricardo Branco <rbranco@suse.com>, ltp@lists.linux.it
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[liwang@redhat.com]
X-Rspamd-Queue-Id: 516777583F
X-Rspamd-Action: no action

> Yes, for the discussion when to use I'd propose to *not* use kconfig if:

> * boot parameter to enable/disable exist
> * check for tristate (functionality which can be compiled as module)
> * kernel new functionality which is unlikely to be backported (use .min_kver instead)

That sounds great to me.

And, plus one more:
   * kconfig file may be unavailable for some reasons


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
