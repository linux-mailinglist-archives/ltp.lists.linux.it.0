Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55EB47D8
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 09:05:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 532FC3C20C6
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 09:05:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 004CE3C1C95
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 09:05:52 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8CEE7201134
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 09:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568703950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=siqJQ1nb75SpXx+v7xbTp04iu4qkpUcHRLwOzbmO/rs=;
 b=B6obs+oVUiPfN12OOh2sCorWU+NX9hb96qya2btOTZlhnAcC6eRLXjxHjoPgkM/v/ZLlAs
 FzXnHPAV6c/IW2Dqgkq/YHKFWWumXl2VMSeSv7VYoZjRzWH8/cM1cvtKd0elCuGkhwmgxH
 Up6Xgxrqi+C/wHA0U+URumXxNBX0w9k=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-cl1tEdaHOOOZ-i7JQ669wA-1; Tue, 17 Sep 2019 03:05:46 -0400
Received: by mail-oi1-f198.google.com with SMTP id c8so1184993oic.18
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 00:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1mQsNcPQ6sdXmyE4mEybT+k3RI2Wc+bQ6P+atUJ1p0=;
 b=kjsH7/aDBsCz9JCoX/b52maZfeCFPKsWRUggnBfuEVZX4P39PDFZrnlYR0lZuMpuht
 8TYEjc7nG2PuNIRHRhf3NhXpSDBMKTNfd2hWjTdXi7VVQJM55S0kyO/aMw9mmak60gk/
 mRcwMSx92MnuDMNn/NImKfmU5Lr+ZN/joNI5Y0TAPozhrI87w/HH8apKHybqg31Vi1HK
 7ErU+PDuORFNujUuZLYp3fLpkhvtAr3xGGiRZGtAeg7AEYFdEhm/9KD2A2KWn3kVd2so
 /i5NL6c+AZsMjokx6dm8/t0NoI6DuVn8eJsh56rvwNxQyXMEWqAspuXhAQPALmPhqpoI
 rwKQ==
X-Gm-Message-State: APjAAAXXiBJOt+v2prdo5lwToW5NebytcTdfRNLetCyKWsiglR34Ez7B
 XwMy1g2I+LuMwnJB+Cu/9QEixj+RZl4SXnbNmbyoHaZ+9Z+LADjQppOn+1zUO8NlyGCHYZQSJk8
 PNtNY8RhA0YxpjAb3VoJ0Z7y+UZU=
X-Received: by 2002:a9d:6a16:: with SMTP id g22mr1491984otn.118.1568703945336; 
 Tue, 17 Sep 2019 00:05:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMk/qlIyPzQerebz9pb7P9pYZ3Z/kvTYhARy+DjBYlGjtKnIv3o5A0pMWJkq1LgF+Kexzv8BcVA5tUe+Zod5k=
X-Received: by 2002:a9d:6a16:: with SMTP id g22mr1491971otn.118.1568703945122; 
 Tue, 17 Sep 2019 00:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190917064027.27208-1-yixin.zhang@intel.com>
In-Reply-To: <20190917064027.27208-1-yixin.zhang@intel.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Sep 2019 15:05:33 +0800
Message-ID: <CAEemH2dcee+DV8hDk1a5B_hnU2pDHy3YkQJcDsX9dm=RKY9k8Q@mail.gmail.com>
To: Yixin Zhang <yixin.zhang@intel.com>
X-MC-Unique: cl1tEdaHOOOZ-i7JQ669wA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp] lib/newlib_tests: add tst_capability0{1,
 2} into .gitignore
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0422224858=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0422224858==
Content-Type: multipart/alternative; boundary="0000000000006844480592ba5982"

--0000000000006844480592ba5982
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Pushed. Thanks~

--=20
Regards,
Li Wang

--0000000000006844480592ba5982
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Pushed. Thanks~</div></div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div=
>Li Wang<br></div></div></div></div>

--0000000000006844480592ba5982--


--===============0422224858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0422224858==--

