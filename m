Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B94C3CB241
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 08:13:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 532FE3C7097
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 08:13:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 267AD3C65BF
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 08:13:57 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 88B3C601DAE
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 08:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626416034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Jzyag53B9mbKg/URFVFOMLizhKC3tVJi/GPw2Nc2/iQ=;
 b=dvV2UHYQOMscJxPtcGSdyUgJx//muI1fUO+caTVpaL70IjiSJhW3kqoT24UKWTMwz1KlrX
 /5ESUGFiflmy+bDVDdqj2QGaY/WFFbth2kYTEHz2ejnc8d67YmeeyW4sbBSisNRRxZB3RP
 V80TxnreZTbXxAShDV74kQA0lgxVfy0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-1Hca0-k0O9CRpGPyP8NlUw-1; Fri, 16 Jul 2021 02:13:51 -0400
X-MC-Unique: 1Hca0-k0O9CRpGPyP8NlUw-1
Received: by mail-pl1-f197.google.com with SMTP id
 n11-20020a170902e54bb029012b5431cb04so1106463plf.12
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 23:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Jzyag53B9mbKg/URFVFOMLizhKC3tVJi/GPw2Nc2/iQ=;
 b=Gh58H9ZS/S8mgjfrA/EWuxZaZyYMRpZlTE3O5XfXIaSa0tOi1OEhOd6nsQbLL0KC3U
 6Qx1w85zmh2nlDGFLNU80ujAvRye8980GpWE2sms7M2VtgX0kW2scv4iG+8nPdcyyv+J
 h3ClUAO9quNEgu1+U6F16oRieTSkwLZ9bCbwYLteL4Kdcbs6q9xhB1ayz5U4mtv6YBzr
 JADMJFOJQGGNHd1cOtzZ/Yi4A9Mh1DKAlht7ljCYHd65P34YV5kEhzgc6vfmRb+CUvwT
 brhAjznpr3lH750rmyGzY6OV5h+tGGNmaFEMrRUrh+Tb9BYU2RCXmf6xqBPR2nP8nA1l
 WM+w==
X-Gm-Message-State: AOAM530PVrGddfxknKp7BaToRmRgZnvLNHDWkrgr9ISj/3zTarM8wQCd
 w1nMOSWvwnhBQEysa5M/93/Zdb5PzJG6QvJ6vPWQy8GTNjI/RaFwKru59arEkKpgwTrYru4MICG
 ehilaFHa8BrfMTfZHXzFFhFRFepA=
X-Received: by 2002:a17:90b:945:: with SMTP id dw5mr8449409pjb.3.1626416030044; 
 Thu, 15 Jul 2021 23:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVzwH6ZACPhZn7E9MJuEEXj77Ns2S6Wcdnm+OHjvb4bVjxJPW9n80j7QGeRCd1UTZ4uOpqBmBMZqhZvPhrl6A=
X-Received: by 2002:a17:90b:945:: with SMTP id dw5mr8449389pjb.3.1626416029621; 
 Thu, 15 Jul 2021 23:13:49 -0700 (PDT)
MIME-Version: 1.0
From: Boyang Xue <bxue@redhat.com>
Date: Fri, 16 Jul 2021 14:13:38 +0800
Message-ID: <CAHLe9YYCDFxqoaciAcz4Ec9bU7cQPJM9SDL2_4ygjcaWx967-A@mail.gmail.com>
To: ltp@lists.linux.it
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bxue@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [question] tst_rhost_run.sh not installed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I'm trying to build, install and run LTP like this:
```
git clone https://github.com/linux-test-project/ltp.git repo_ltp
pushd repo_ltp/
make autotools
./configure
make
make install
# export RHOST, LHOST, etc. test vars
export LTPROOT=/opt/ltp; export PATH=$LTPROOT/bin:$LTPROOT/testcases/bin:$PATH
./runltp -d /test -f net.nfs
```

During the test run, it complains that
```
/opt/ltp/testcases/bin/tst_net.sh: line 979: bash:: command not found
```
line#979 is:
```
eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST || echo "exit $?")
```

I can find tst_net_iface_prefix in the $PATH, so it should be
tst_rhost_run which leads to the error.
Searching for tst_rhost_run in /opt/ltp and $PATH shows not found, so
is it a bug or did I miss something that the file wasn't installed?

It happens on the latest LTP:
```
# git rev-parse --short HEAD
5d8f9dfd6
```

Thanks,
Boyang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
