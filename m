Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE63BF65F
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:04:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3EFF3C22D6
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:04:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DE1503C0137
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:04:41 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D0CDA2011A0
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:04:40 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8QFsFND171931;
 Thu, 26 Sep 2019 16:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=gdTkC2ATMKRJXLTLxlLJahE5tTU+YeW8OmIosbjjRqc=;
 b=Ih2qtoZqg8UjnDER3bCzXyBjATU7HP4ZrwqbVC9QUGyrPAjoEbQsQSBqqS0XBnd8MRoo
 oZLeWnuR/lvUHxHLGMZXc2UcOfBT0qT170KCwJ3076urmVcL1QV2uRqVhbSNUFNc//3Q
 SVwZ7/GGAZQBo3UkaHp/MY/7ayNg2eg73FAG6LsTa7LnXuNFruXuV5HFfrTkhIZAfwL9
 IdSdYy0mbxMifIV2yWloa+BwyicP8gl5ehlYIUfA6AeLmuHBYZK0akJ83VbY3i+FUkU6
 XT63GDr4eVPnLYjuZ5WvqH1fw1lxK92tTJwxlL/PkfR3vOh71NAo1omFVDkhJ9yWDSMl rA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2v5b9u4us1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 16:04:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8QFsVc7028002;
 Thu, 26 Sep 2019 16:04:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2v82tneajr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 16:04:37 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8QG4X2J026163;
 Thu, 26 Sep 2019 16:04:33 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Sep 2019 09:04:33 -0700
Date: Thu, 26 Sep 2019 09:04:32 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190926160432.GC9916@magnolia>
References: <20190926155608.GC23296@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926155608.GC23296@dell5510>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9392
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909260142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9392
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909260142
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] copy_file_range() errno changes introduced in v5.3-rc1
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
Cc: linux-xfs@vger.kernel.org, Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 26, 2019 at 05:56:08PM +0200, Petr Vorel wrote:
> Hi Amir,
> 
> I'm going to fix LTP test copy_file_range02 before upcoming LTP release.
> There are some returning errno changes introduced in v5.3-rc1, part of commit 40f06c799539
> ("Merge tag 'copy-file-range-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux").
> These changes looks pretty obvious as wanted, but can you please confirm it they were intentional?
> 
> * 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") started to return -EXDEV.
> * 96e6e8f4a68d ("vfs: add missing checks to copy_file_range") started to return -EPERM, -ETXTBSY, -EOVERFLOW.

I'm not Amir, but by my recollection, yes, those are intentional. :)

--D

> Thanks for info.
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
