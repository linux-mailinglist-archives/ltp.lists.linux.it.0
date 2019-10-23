Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D087E109E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 05:36:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 316623C22D9
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 05:36:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9AA673C22CB
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 05:36:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5F6891A01110
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 05:36:16 +0200 (CEST)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09F1681F07
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 03:36:14 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id l25so10052704otp.10
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 20:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ozK8tBoSJmePSSrCXdSVTXJUjCgN3KIZ5sQh/jSAfEc=;
 b=OPIPbM+NgYN9c+Cah0WlhDOqk/Ud7CbVj8ZqktUDSFVEGUsSR9sKMsUWN18ZpGzYmp
 XaiHI+x+JpJlGTNSgb89sYB7sj4JgOypTFXNafUF8Oj10RhK45s6l6gwkO+taJf5tpWe
 u0cC22xthkpI9cz8s05yBGhfpF4TRFIqeXiDGh+6j1XR6q1R/1+adELIr7+MipgEF0IZ
 NliyZMfbDljFjP73epBSWAnsuwaScwHEis79di//kSkwtIHFsHp1swC7FetVwFNKyHig
 t7uW8A/ZRs/E11c5CDC1cH+0cstOXatpHI2upPpWSXEQJd0YmtbFkEkzuFETnk0W372U
 ftug==
X-Gm-Message-State: APjAAAUY+Rd+C/AGJlH/dFLkdb62iNq3+/1P7i3ph9tpl7PO0Qhnp9mx
 /YKUHm0dJYxBuqyyL0jdUgrVaylqBI9g1z3Qu5QetzgzOrIse4UEQ+oTY+A+v7bxMo45Rt0OkDK
 68uUH2Cwakj0aziH/n57GusaNyfA=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr5218035oth.118.1571801773499; 
 Tue, 22 Oct 2019 20:36:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwS7riNewSF/mpeaD0s1BgLiELikaARQHwOE0YoEnb5SR4rNIfH8TrgJpqHcsAK23Mfi/LgwNUY8AzJXeyZ5k4=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr5218020oth.118.1571801773161; 
 Tue, 22 Oct 2019 20:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191023025606.24449-1-pifang@redhat.com>
In-Reply-To: <20191023025606.24449-1-pifang@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Wed, 23 Oct 2019 11:36:02 +0800
Message-ID: <CAEemH2cTA8nad9iwh--r5mHX7Eru2UsbJ1reMYK2ZKx2XoGYtg@mail.gmail.com>
To: Ping Fang <pifang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pkeys/pkey01: build fail MAP_HUGETLB
 undefine
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
Content-Type: multipart/mixed; boundary="===============0760760960=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0760760960==
Content-Type: multipart/alternative; boundary="00000000000058e7d805958b9e05"

--00000000000058e7d805958b9e05
Content-Type: text/plain; charset="UTF-8"

Merged.

-- 
Regards,
Li Wang

--00000000000058e7d805958b9e05
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div class="gmail_default" style="font-size:small">Merged.</div></div><div><br></div>-- <br><div dir="ltr" class="gmail_signature"><div dir="ltr"><div><div dir="ltr">Regards,<br>Li Wang<br></div></div></div></div></div>

--00000000000058e7d805958b9e05--

--===============0760760960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0760760960==--
