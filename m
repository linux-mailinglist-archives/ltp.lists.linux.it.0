Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 801573CC2D6
	for <lists+linux-ltp@lfdr.de>; Sat, 17 Jul 2021 13:33:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 155A03C697C
	for <lists+linux-ltp@lfdr.de>; Sat, 17 Jul 2021 13:33:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F5163C4CB6
 for <ltp@lists.linux.it>; Sat, 17 Jul 2021 13:33:51 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 805B66006DB
 for <ltp@lists.linux.it>; Sat, 17 Jul 2021 13:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626521629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q0zxvTF+XiHoai+swkU5R9I8OD12xBvwfyjgAn+bEEk=;
 b=Kr2ppGDAhqdJe3a3yKGJ71II9iFw5gnJ2NA1iBu6Ems93vONE3WY07bzdIuDm2uuP56fkF
 XXgPE48cY5uL+fx+T3pQt8Tn5nD3SvtzpfaPCbOAp0/iZ5w/tI5lndQzJZGTd6/1fu4txq
 k6RjY/ROvDBcM+nxm9eCkY7Q/FVsuSo=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-hG-96snuOwKzS9CUQQgWag-1; Sat, 17 Jul 2021 07:33:46 -0400
X-MC-Unique: hG-96snuOwKzS9CUQQgWag-1
Received: by mail-pg1-f198.google.com with SMTP id
 j13-20020a63594d0000b0290228b387f4a3so9362555pgm.13
 for <ltp@lists.linux.it>; Sat, 17 Jul 2021 04:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q0zxvTF+XiHoai+swkU5R9I8OD12xBvwfyjgAn+bEEk=;
 b=t5hsHFHBxJ5aN/Uliw24oIRAehFUnSZF52+Z+0CQ9NfQ+4zym3fMMlhcnn0EQn9SMa
 i03XgrbCn3XtIL0EA81RMsZk64q+LVCza6dU1pX9yMLMHWYr6Yc7SWplZjqSWTeAQbul
 D9ryrTCjP/ybcgs6aeLCscg0pbx4keRtyoRvFj+TwwmwFYGNe/+l7z0X+UeXnLg0foyF
 5pKyKJB9jab8QSXbv64c+ZV8GbO/mDddHD5mlxc0LQTkIL7qyyft6azkTJgvi+I5W0iN
 0aKt5SlBpYCzg9FwqKWfWCcctO5M9ZIMNmqtFTqNrVMSEVG+uiaNFCmG9BFBzXOlNdRP
 9Low==
X-Gm-Message-State: AOAM530n4gC5tdME3Obc/Mgy79DLsNzgi2QMxX4+RWADChq0oweb+IFh
 XeqFZERtHsSOmoSaMNVoN9NyJd9uHhq0OwVmOj1/LOqFx2+/NvRGio2JXDnmu7Im6DmgWeH/w+s
 9rJUw0LqBbmOrC+A5hyINtL5vlQs=
X-Received: by 2002:a65:4d4c:: with SMTP id j12mr14490882pgt.311.1626521625631; 
 Sat, 17 Jul 2021 04:33:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwemJgaqgpsKx/CX55Qf7Hvq+wkDEMA2PZ/+wBPx484VnSIV02BcS5N6q8EScX3S6wVKKu5SpqawxsMQM4WI9E=
X-Received: by 2002:a65:4d4c:: with SMTP id j12mr14490853pgt.311.1626521625182; 
 Sat, 17 Jul 2021 04:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHLe9YYCDFxqoaciAcz4Ec9bU7cQPJM9SDL2_4ygjcaWx967-A@mail.gmail.com>
 <48573d84-20e4-11a1-6306-d82b6ada6efd@jv-coder.de> <YPFbIiNl3W9RR2i/@pevik>
In-Reply-To: <YPFbIiNl3W9RR2i/@pevik>
From: Boyang Xue <bxue@redhat.com>
Date: Sat, 17 Jul 2021 19:33:32 +0800
Message-ID: <CAHLe9YZTw0F1LfmHGokJTRXGu3Th2Z_4yizqxdUuw=QpNpcVEQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bxue@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [question] tst_rhost_run.sh not installed
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Thanks Petr and Joerg!

Yes. I was testing with the two-host setup. Previously RHOST didn't
have LTP installed, so there's no tst_net_iface_prefix. After
installing LTP on RHOST and setting LTPROOT & PATH env variables
there, the error disappeared and it works well now.

Thanks,
Boyang

On Fri, Jul 16, 2021 at 6:20 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> > Hi,
>
> > Sorry for the duplicate, I forgot to add the mailing list...
>
> > On 7/16/2021 8:13 AM, Boyang Xue wrote:
> > > Hi,
>
> > > I'm trying to build, install and run LTP like this:
> > > ```
> > > git clone https://github.com/linux-test-project/ltp.git repo_ltp
> > > pushd repo_ltp/
> > > make autotools
> > > ./configure
> > > make
> > > make install
> > > # export RHOST, LHOST, etc. test vars
> > > export LTPROOT=/opt/ltp; export PATH=$LTPROOT/bin:$LTPROOT/testcases/bin:$PATH
> > > ./runltp -d /test -f net.nfs
> > > ```
>
> > > During the test run, it complains that
> > > ```
> > > /opt/ltp/testcases/bin/tst_net.sh: line 979: bash:: command not found
> > > ```
> > > line#979 is:
> > > ```
> > > eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST || echo "exit $?")
> > > ```
>
> > > I can find tst_net_iface_prefix in the $PATH, so it should be
> > > tst_rhost_run which leads to the error.
> > > Searching for tst_rhost_run in /opt/ltp and $PATH shows not found, so
> > > is it a bug or did I miss something that the file wasn't installed?
> > No tst_rhost_run is a shell function defined in tst_net.sh.
> > I guess the problem is your RHOST setup.
> > LTP supports two setups for network tests:
> > 1. network namespace based. This is used if you don't set RHOST and LHOST.
> > 2. Two-host setup, where RHOST points to a second host.
>
> > The important thing in two host setup is, that $LTP_ROOT/testcases/bin is in
> > the PATH for the user, that is used on the RHOST.
> > I guess what happens in your setup is that tst_net_iface_prefix is not found
> > on the RHOST, because it is not in the path.
>
> +1
> FYI see
> https://github.com/linux-test-project/ltp/tree/master/testcases/network
>
> Kind regards,
> Petr
>
> > Joerg
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
