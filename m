Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A82532AB893
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:49:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B45E3C2F80
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:49:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4A2663C0888
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:49:14 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B85B2600157
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604926152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7O4VI048/DpbltN5RzJEiSOXXZHHiHWIxAJ0nafgzE=;
 b=Mx5RqhVz/9fcecW90egmqkPfHRid40ruMamZ7pkR0Tsd8cQNFSzsPNH7brjl16FPljJTfk
 sptqGp2qyziccocfae4/Dx50SWrGbgmAMVW6+hkSK8LBvabWYuzJokk8uDSTyPMoQZI6jY
 PhA0BWrb3C95eTkPOOmpZnnaHmlzIBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-SyUVBoEdOAGMwAZNxO3C5g-1; Mon, 09 Nov 2020 07:49:10 -0500
X-MC-Unique: SyUVBoEdOAGMwAZNxO3C5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F07510866AA
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 12:49:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8861B62A14
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 12:49:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAB55CF60;
 Mon,  9 Nov 2020 12:49:08 +0000 (UTC)
Date: Mon, 9 Nov 2020 07:49:08 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <69530275.22574785.1604926148605.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2f-okBCGktRfT5-RgkXziAu3FrFAN7Qih2vz=A9mfJzRw@mail.gmail.com>
References: <5d6e978c803e4e6449cabd89596729bfad996a17.1604408825.git.jstancek@redhat.com>
 <CAEemH2dHXYbmkbzccWNurYURZQJJ4GENRBr=6KfQaL5HJaBO2g@mail.gmail.com>
 <CAEemH2f-okBCGktRfT5-RgkXziAu3FrFAN7Qih2vz=A9mfJzRw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.76, 10.4.195.21]
Thread-Topic: lib/tst_cgroup: fix short reads of mems/cpus
Thread-Index: yqTKc8WM4WrQGKkad29jOADTNKAPSA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_cgroup: fix short reads of mems/cpus
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
> On Wed, Nov 4, 2020 at 2:22 PM Li Wang <liwang@redhat.com> wrote:
> 
> > ...
> >> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf);
> >> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf,
> >> sizeof(buf));
> >>         tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "cpus", buf);
> >> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems);
> >> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems,
> >> sizeof(buf));
> >>
> >
> > sizeof() is generally used to calculate the size (in bytes) of a data type,
> > e.g sizeof(char *).
> > I think here to pass 'BUFSIZ' directly is better than sizeof(buf).
> >
> 
> Jan, do you agree with this point?
> If yes, I can help to modify and apply this patch.

2nd line should have been sizeof(mems), but BUFSIZ will work too.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
