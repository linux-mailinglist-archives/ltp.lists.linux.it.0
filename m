Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF4B27435
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Aug 2025 02:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1755218701; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=64CRfGKWVIlNlzZoZWkrjq1TMFj+Txv7P88qkeKT2Es=;
 b=bFcTNgWJJ39jap45Tt3qhUv+WZqUazC7GjLE0vqBhWuWnBZe7rEoVQuszf4bUsRGC9/6z
 i3FJaP3S/Omuso0Gy0UUwtTlSW/6PP6CugDxCu8zgztSUgrudPApORYOQq37WRyAQUvLNp1
 /orO8bIfnY7kpROPh8Bwz6h9nB8MVOg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 161A83CBE66
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Aug 2025 02:45:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 830853C6846
 for <ltp@lists.linux.it>; Fri, 15 Aug 2025 02:44:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9AF946168CC
 for <ltp@lists.linux.it>; Fri, 15 Aug 2025 02:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755218684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=spqasDZV4sleQKSvBeM7vD0Z3kuSIZKviFYDijF+JWk=;
 b=Z+HSyCWGqtD7ulFhNLxpVJM0lxUM4marSQXaOjkXfvBFgGrVpg9YSiiH3d+GYxzmDABPsU
 0KVMLsWmdpgezXE5dBY7WOVktl7Efhz5FYXcrsTrKFNpXfZlyC/8DsqME6BGo+mvA3JPak
 PouQ7k1cWakCyngb1aJBlIkF8Ov+qfY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-JBVeYS6yOJS0kePYQsCqQw-1; Thu, 14 Aug 2025 20:44:42 -0400
X-MC-Unique: JBVeYS6yOJS0kePYQsCqQw-1
X-Mimecast-MFC-AGG-ID: JBVeYS6yOJS0kePYQsCqQw_1755218682
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244581950a1so17431815ad.2
 for <ltp@lists.linux.it>; Thu, 14 Aug 2025 17:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755218682; x=1755823482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spqasDZV4sleQKSvBeM7vD0Z3kuSIZKviFYDijF+JWk=;
 b=oi2OW4p132zP6CFzUx1exYgmh4DM0tUg5gxUSjB+i1PAqOp3Dd6eG3F8rXOBVwxkRc
 zSd/BxCxM+KLAbE9IBQbEt3KP+a7fIKG2vqENmilz8d/jiK4SWOEhtMGeggqpp9gRoI3
 fkkcNV1PAdJUEz/F8u8zno+hD/NkjeaNu53OofqpMKoVXETE/OUsG16tQzNWflusfRm8
 HKejPglcRXUgyrmFAwyUkjLxKOncHFcKreciy6iLlgu32KBOC5GriFaLxGxJQYgGpS2C
 SgQx3Ko7jF2YM8Kq65c9xueqXa5IkyI2WgiZBuWEbSJUN8628Nke5W3TAlRvPupgMzFs
 mqDg==
X-Gm-Message-State: AOJu0Yy3AN9qgKzMThUbDsIVJ8F+EqquhHg8p711uSxchnB032uBqBp/
 Wp35cCz4RzOw0wvdtp+eMQug/6ZYtuPxtBMjHJs5gOg8acKBeep60//MkmEUmCcC8ceFgW09xpJ
 8oEJeeIoxzajhcRsmNIwaAgEyMv4y+bAGqVvZxeKeDNy3BIGlgYJ2JpYsRvD2JZQgZr9J5SNFOK
 pkZh9kT/vqXDk4sAR6k6VuTPJrcvk=
X-Gm-Gg: ASbGncvgvdw6fj+LaQbnmwLIHH2IBA+EppGFgq7yGcaHMdaY2nLPNqwPyMZYJhJ7QHu
 DdN8wn6uYOfUdLL4NK60cOB3wpJKlaMVNs/cu4A/616FkQyQE1FNwu5FudltUKgbLTIrv79AWUd
 mjiE0DLn6TFs6XYrhiCsaB3Q==
X-Received: by 2002:a17:902:cccb:b0:235:7c6:ebdb with SMTP id
 d9443c01a7336-2446d6dc1bemr2664555ad.10.1755218681623; 
 Thu, 14 Aug 2025 17:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMvIE9ZleD/E4Wjkxc0YsyVnhm0RzkIy7w7ZcdNoNQhProsXMSaVPCoS4FrXvORSLxweU8RbyvsFkyHLF1wwQ=
X-Received: by 2002:a17:902:cccb:b0:235:7c6:ebdb with SMTP id
 d9443c01a7336-2446d6dc1bemr2664335ad.10.1755218681217; Thu, 14 Aug 2025
 17:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250812141709.33540-1-liwang@redhat.com>
 <20250814130629.GA575710@pevik>
In-Reply-To: <20250814130629.GA575710@pevik>
Date: Fri, 15 Aug 2025 08:44:28 +0800
X-Gm-Features: Ac12FXxnMamBjJbnlR7uF9v20FZ5A1JQVE-nQSpriAtaWMx4snxys82LtX5wnZ0
Message-ID: <CAEemH2fgnJH201_fvDvPRbAFrfdEz4v_cEg-LXudWje-+w68VA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -QEJUIe8Hp_MIcfiOIkvi4T5BAPve_PZTqovb5pjnxI_1755218682
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] tst_mkfs: print short hint when mkfs fails in
 device busy
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
Cc: rafael.tinoco@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Petr Vorel <pvorel@suse.cz> wrote:

> > diff --git a/lib/tst_mkfs.c b/lib/tst_mkfs.c
> > index 736324f04..dfec06a21 100644
> > --- a/lib/tst_mkfs.c
> > +++ b/lib/tst_mkfs.c
> > @@ -107,6 +107,10 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
> >                       "%s not found in $PATH", mkfs);
> >       break;
> >       default:
> > +             tst_resm_(file, lineno, TWARN,
> > +                     "Check if mkfs failed with the (loop) device busy. "
> > +                     "Background probing (e.g., udisks2) can cause this. \n"
> When 2 lines are needed, could it be without trailing space?
>                         "Background probing (e.g., udisks2) can cause this.\n"
>
> nit: I don't like LTP messages are split on more lines, but this is indeed too
> long.

+1

> > +                     "Consider temporarily stopping udisks2 during the test.");
>
> We already have suggestion about some process running in tst_umount()
> in lib/tst_device.c:
>
>                         tst_resm(TINFO, "Likely gvfsd-trash is probing newly "
>                                  "mounted fs, kill it to speed up tests.");

This is a good example, thanks!!

(The debugging work exhausted my energy this week, and I felt like my
brain was stuck there, unable to write a simple printed message.)

So what about:

 tst_resm_(file, lineno, TWARN,
    "mkfs may have failed because the device is busy (e.g., udisks2 probing). "
    "Consider disabling background probing services.");


> Would you agree to have a library function which would parse
> /proc/*/comm to check if particular process is running?
> (I would do it as a separate effort).

Yes, that would be helpful to confirm some special damon is running,
if something you were mean:

if (tst_proc_comm_running("udisksd", NULL) ||
    tst_proc_comm_running("gvfsd-trash", NULL)) {
    tst_resm_(file, lineno, TINFO,
              "Likely udisksd/gvfsd-trash is probing newly mounted fs
in backgroud... ");
}


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
