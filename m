Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C7EABD9
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 09:53:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F1673C22DD
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 09:53:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EF92D3C229E
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 09:53:16 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2ECE0201117
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 09:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572511994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92TQn/G0mCmtkrmZnwIBMp+VBc/A2w3tKt/K8JPUtr8=;
 b=hLn/7mef0J4FEmpGy79FP0gUNxrhFXgpnIOvpHHbKVaZfQViSxDZWUxUqgmFJIJVetG2Vr
 l6ny0PGc/F6/TU5Be9+OnMfeorkJo1c3g/tZGYzhqJ4rfPzK69Vn5/LWIQlTIfy+/ITDjM
 92IZRxCdaUjmabkA7JvkmOUDigK2DCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-AsUslSbgOLSgb5PJyCtNPw-1; Thu, 31 Oct 2019 04:53:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33ECD1800D55;
 Thu, 31 Oct 2019 08:53:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BEA05C1BB;
 Thu, 31 Oct 2019 08:53:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20DA24BB5B;
 Thu, 31 Oct 2019 08:53:10 +0000 (UTC)
Date: Thu, 31 Oct 2019 04:53:09 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <2003376860.9886044.1572511989903.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dO95d2_CZyMpE4fM8CcC+p0ou9XfA43sS9fX0LmQBWoQ@mail.gmail.com>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
 <20191030144649.GA25642@dell5510>
 <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
 <CAEemH2dO95d2_CZyMpE4fM8CcC+p0ou9XfA43sS9fX0LmQBWoQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.3]
Thread-Topic: syscalls/acct02: Check read size.
Thread-Index: 2QmZA8vpmYil2+EH2u5h6kwzplE/DQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: AsUslSbgOLSgb5PJyCtNPw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> > Above was RHEL7. Do you expect different outcome on RHEL8?
> > I was looking at upstream sources too and it looked similar.
> >
> > Anyway, I don't think this part is an issue, test will skip it
> > because "comm" doesn't match.
> >
> > We can tweak 'ac_btime' condition, but I think the test will remain
> >
> 
> How much time of the ac_btime shaking to be tolerated is proper?

I wanted to go with 1 sec:

@@ -83,7 +83,7 @@ static int verify_acct(void *acc, int elap_time)
                ret = 1;
        }
 
-       if (ACCT_MEMBER(ac_btime) < start_time) {
+       if (ACCT_MEMBER(ac_btime) + 1 < start_time) {
                tst_res(TINFO, "ac_btime < %d (%d)", start_time,
                        ACCT_MEMBER(ac_btime));
                ret = 1;

> 
> > race-y in environments with higher steal time:
> >
> 
> I'm sorry, what does it mean here?

I was referring to failed check below. s390 is scarce resource
and when over-committed, sleeps are less consistent.
E.g. sleep(1) taking 2+ seconds:
  nanosleep({1, 0}, NULL) = 0 <1.926617>

> 
> 
> 
> >
> > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > acct02.c:192: INFO: == entry 1 ==
> > acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> > acct02.c:192: INFO: == entry 2 ==
> > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > acct02.c:141: INFO: ac_ppid != 43213 (43212)
> > acct02.c:182: FAIL: end of file reached


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
