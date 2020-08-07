Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 581FE23EC59
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:23:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26A583C31F0
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:23:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6AA983C2A76
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:23:52 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 66F3E1A01017
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596799429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLk45tPE+WUIZ+TWLghGUARb9SM6riasZ/jfBJm1TnI=;
 b=d+h6Tru2klzqOm1DB7HXw+x3ylD8MLF0Tq5YbCnsBBTJzKoh525jfjbgU7XT1+4t9LEH1P
 pm6EWVRJxTdHXzo+3DcxYEGxyG095CAMG4v3yZFjMwGm3hbIi6hWlA5LWN9px50E3//43A
 eryhGxtb91Bjj01dRAmAhrzJpOuLqi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-q7r9Zj59MDOIhXTbmjlS4w-1; Fri, 07 Aug 2020 07:23:47 -0400
X-MC-Unique: q7r9Zj59MDOIhXTbmjlS4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD8F58;
 Fri,  7 Aug 2020 11:23:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1FA01001B2B;
 Fri,  7 Aug 2020 11:23:45 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF26818095FF;
 Fri,  7 Aug 2020 11:23:45 +0000 (UTC)
Date: Fri, 7 Aug 2020 07:23:45 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <282506361.7043502.1596799425598.JavaMail.zimbra@redhat.com>
In-Reply-To: <2103348435.6776074.1596632339725.JavaMail.zimbra@redhat.com>
References: <9927ed18c642db002e43afe5e36fb9c18c4f9495.1594811090.git.jstancek@redhat.com>
 <1881588710.5797015.1596457102422.JavaMail.zimbra@redhat.com>
 <20200805125357.GE5522@yuki.lan>
 <2103348435.6776074.1596632339725.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.2]
Thread-Topic: selftests: vdso: hash entry size on alpha, s390x is 8 bytes
Thread-Index: LErn1s/S3CQkYyPud6YH5FoxnTRnDI7iYEbs
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] selftests: vdso: hash entry size on alpha,
 s390x is 8 bytes
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
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org, ltp@lists.linux.it,
 skhan@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> 
> ----- Original Message -----
> > Hi!
> > As much as it's worth the changes looks good to me.
> > 
> > @Jan: I guess that we can as well fix this in LTP first then we can try
> >       to get the kernel version fixed...
> 
> Fine by me, I'll give it couple more days then push it.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
