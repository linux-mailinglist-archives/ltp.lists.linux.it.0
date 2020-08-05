Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B923CAC9
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:59:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FC4B3C3278
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:59:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8A2F23C1414
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 14:59:07 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 186281A0120D
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 14:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596632345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiK5k6fQ4nTS/LjWEHo0nQghwGsQ621dFVfJLaLDCWs=;
 b=ATh+kA8SM5jbYmD8eAF0C8gVWbVwV7JczNpYH+d7nB+dk3BF7oq8s3t1ZZRejnyWfl8gCF
 xP1qM9QgICNtJEabyGm0qgNzi5RKCetrGqZOrFMuJoB45i25IV/qQ6yZctdT0Cqbh8IZqd
 gztbFrWtVWef9cxjyleiUKkAZhKNJlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-vtXiDUW-P8C8K4eW7NIOWg-1; Wed, 05 Aug 2020 08:59:01 -0400
X-MC-Unique: vtXiDUW-P8C8K4eW7NIOWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E31B57;
 Wed,  5 Aug 2020 12:59:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8596D7B90B;
 Wed,  5 Aug 2020 12:59:00 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1BF395467;
 Wed,  5 Aug 2020 12:58:59 +0000 (UTC)
Date: Wed, 5 Aug 2020 08:58:59 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <2103348435.6776074.1596632339725.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200805125357.GE5522@yuki.lan>
References: <9927ed18c642db002e43afe5e36fb9c18c4f9495.1594811090.git.jstancek@redhat.com>
 <1881588710.5797015.1596457102422.JavaMail.zimbra@redhat.com>
 <20200805125357.GE5522@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.16]
Thread-Topic: selftests: vdso: hash entry size on alpha, s390x is 8 bytes
Thread-Index: LErn1s/S3CQkYyPud6YH5FoxnTRnDA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> Hi!
> As much as it's worth the changes looks good to me.
> 
> @Jan: I guess that we can as well fix this in LTP first then we can try
>       to get the kernel version fixed...

Fine by me, I'll give it couple more days then push it.

I did repost it with original author CC-ed:
  https://lore.kernel.org/lkml/93a07b1808e61babef3a20542cbeb4565d3c8410.1596458924.git.jstancek@redhat.com/
but haven't heard back yet.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
