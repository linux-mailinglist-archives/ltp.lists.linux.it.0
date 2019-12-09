Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA584116815
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 09:26:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4531E3C2380
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 09:26:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7308F3C1D95
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 09:26:50 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2A21E6015B2
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 09:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575880008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuQftgKLhIdfbe43m9PaVlygiTsJJ2gGUjVhGbD1VTM=;
 b=JhhP0HRpLHb/+ubPnNwToEoILbSOQ+xFAH3VHp0BZzz8f+Mup4pWRFDTFRczBreZ96g33y
 OirWuUwBZoDDWtjRB3bOQ+cQ1Yj5x9roZTQBUz3eYm7PFy+cltdObbsA+Rh4S1kLw5VOy8
 RPEfFPdLwkS4kEUHpLCGGgRNmphmnZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-LYEmGze7OVu4X7zepRIt7g-1; Mon, 09 Dec 2019 03:26:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A580C801E7A;
 Mon,  9 Dec 2019 08:26:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69C1C60BE1;
 Mon,  9 Dec 2019 08:26:39 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC9DA18089C8;
 Mon,  9 Dec 2019 08:26:38 +0000 (UTC)
Date: Mon, 9 Dec 2019 03:26:38 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: dftxbs3e <dftxbs3e@free.fr>
Message-ID: <35957501.15762152.1575879998305.JavaMail.zimbra@redhat.com>
In-Reply-To: <f874ea14-becc-9c4b-2f2f-351573e6a751@sandeen.net>
References: <9c0af967-4916-4e8b-e77f-087515793d77@free.fr>
 <e9a171cc-6827-5c43-092a-9dcd8a997b5a@free.fr>
 <f874ea14-becc-9c4b-2f2f-351573e6a751@sandeen.net>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: userspace hitting sporadic SIGBUS on xfs (Power9, ppc64le),
 v4.19 and later
Thread-Index: Dxe2axPz7lr/TlY+65kmscNpeXn5Kw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LYEmGze7OVu4X7zepRIt7g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [bug] userspace hitting sporadic SIGBUS on xfs (Power9,
 ppc64le), v4.19 and later
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
Cc: hch@infradead.org, darrick wong <darrick.wong@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Memory Management <mm-qe@redhat.com>,
 Eric Sandeen <sandeen@sandeen.net>, linux-xfs@vger.kernel.org,
 CKI Project <cki-project@redhat.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> 
> 
> On 12/6/19 6:09 PM, dftxbs3e wrote:
> > Hello!
> > 
> > I am very happy that someone has found this issue.
> > 
> > I have been suffering from rather random SIGBUS errors in similar
> > conditions described by the author.
> > 
> > I don't have much troubleshooting information to provide, however, I hit
> > the issue regularly so I could investigate during that.
> > 
> > How do you debug such an issue? I tried a debugger etc. but besides
> > crashing with SIGBUS, I couldnt get any other meaningful information.

If it's same issue, you could check if dropping caches helps.
Figure out what page is it with crash or systemtap and look at page->flags
and ((struct iomap_page *)page->private)->uptodate bitmap.

> 
> You may want to test the patch Christoph sent on the original thread for
> this issue.

Or v5.5-rc1, Christoph's patch has been merged:
  1cea335d1db1 ("iomap: fix sub-page uptodate handling")


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
