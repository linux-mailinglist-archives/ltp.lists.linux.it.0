Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 467EB1101E4
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 17:09:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE98E3C2726
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 17:09:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 68C0C3C2477
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 17:09:26 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 836FF1A00E25
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 17:09:25 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3G9101187017;
 Tue, 3 Dec 2019 16:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=C0csOh2IiwBU5rvm/p9C2Rx3FifNjZcosDBlbkKZ43o=;
 b=boQXu3APvvYLEv5xvZUy66ylMTjWdR8SQ8XqXS/bsfn4lRshgT6DmNGUWx475cUzj13b
 M5pssdl5Wudwqxkldan7mmqoPL+RfjvQtP6meKmRqnSnzsdJUIpV45NodVSYd0n+8W3+
 zt0LSUYI3j1GX7AZgBaWYFvKqq3beN+jJJXRy8tfORrs4hv8S0ymJyVAYq59fIB8rRsI
 VxEX2Alcz5CE4XB8RnIXuCPEWAYjZeVAPv3B/UZ8eLx185N+11H9ORIsmVYaty4igRV+
 8VIE3lmuyUn+VG+yQYJvuZv69TFc9dFDmLXOMp1r7XiPbc/m0WKF615cEs4eBF+alVeS 7w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2wkfuu8tgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 16:09:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3G8lZh034082;
 Tue, 3 Dec 2019 16:09:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2wn4qq6cg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 16:09:04 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB3G8e93008786;
 Tue, 3 Dec 2019 16:08:40 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Dec 2019 08:08:40 -0800
Date: Tue, 3 Dec 2019 08:08:39 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191203160839.GJ7335@magnolia>
References: <cki.6C6A189643.3T2ZUWEMOI@redhat.com>
 <1738119916.14437244.1575151003345.JavaMail.zimbra@redhat.com>
 <8736e3ffen.fsf@mpe.ellerman.id.au>
 <1420623640.14527843.1575289859701.JavaMail.zimbra@redhat.com>
 <1766807082.14812757.1575377439007.JavaMail.zimbra@redhat.com>
 <20191203130757.GA2267@infradead.org>
 <433638211.14837331.1575383728189.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <433638211.14837331.1575383728189.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912030122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912030122
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: linux-xfs@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, CKI Project <cki-project@redhat.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Dec 03, 2019 at 09:35:28AM -0500, Jan Stancek wrote:
> 
> ----- Original Message -----
> > On Tue, Dec 03, 2019 at 07:50:39AM -0500, Jan Stancek wrote:
> > > My theory is that there's a race in iomap. There appear to be
> > > interleaved calls to iomap_set_range_uptodate() for same page
> > > with varying offset and length. Each call sees bitmap as _not_
> > > entirely "uptodate" and hence doesn't call SetPageUptodate().
> > > Even though each bit in bitmap ends up uptodate by the time
> > > all calls finish.
> > 
> > Weird.  That should be prevented by the page lock that all callers
> > of iomap_set_range_uptodate.  But in case I miss something, does
> > the patch below trigger?  If not it is not jut a race, but might
> > be some weird ordering problem with the bitops, especially if it
> > only triggers on ppc, which is very weakly ordered.
> > 
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index d33c7bc5ee92..25e942c71590 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -148,6 +148,8 @@ iomap_set_range_uptodate(struct page *page, unsigned off,
> > unsigned len)
> >  	unsigned int i;
> >  	bool uptodate = true;
> >  
> > +	WARN_ON_ONCE(!PageLocked(page));
> > +
> >  	if (iop) {
> >  		for (i = 0; i < PAGE_SIZE / i_blocksize(inode); i++) {
> >  			if (i >= first && i <= last)
> > 
> 
> Hit it pretty quick this time:
> 
> # uptime
>  09:27:42 up 22 min,  2 users,  load average: 0.09, 13.38, 26.18
> 
> # /mnt/testarea/ltp/testcases/bin/genbessel                                                                                                                                     
> Bus error (core dumped)
> 
> # dmesg | grep -i -e warn -e call                                                                                                                                               
> [    0.000000] dt-cpu-ftrs: not enabling: system-call-vectored (disabled or unsupported by kernel)
> [    0.000000] random: get_random_u64 called from cache_random_seq_create+0x98/0x1e0 with crng_init=0
> [    0.000000] rcu:     Offload RCU callbacks from CPUs: (none).
> [    5.312075] megaraid_sas 0031:01:00.0: megasas_disable_intr_fusion is called outbound_intr_mask:0x40000009
> [    5.357307] megaraid_sas 0031:01:00.0: megasas_disable_intr_fusion is called outbound_intr_mask:0x40000009
> [    5.485126] megaraid_sas 0031:01:00.0: megasas_enable_intr_fusion is called outbound_intr_mask:0x40000000
> 
> So, extra WARN_ON_ONCE applied on top of v5.4-8836-g81b6b96475ac
> did not trigger.
> 
> Is it possible for iomap code to submit multiple bio-s for same
> locked page and then receive callbacks in parallel?

Yes, if (say) you have 64k pages on a 4k-block filesystem and the extent
mapping for all 16 blocks aren't contiguous, then iomap will issue
separate bios for each physical fragment it finds.  iomap will call
submit_bio on those bios whenever it thinks it's done filling the bio,
so you can indeed get multiple callbacks in parallel.

--D

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
