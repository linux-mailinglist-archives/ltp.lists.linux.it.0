Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13639D6CC
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:10:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDBB43C574C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:10:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C757F3C187D
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:10:10 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5407C1400547
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:10:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 718971FDA5;
 Mon,  7 Jun 2021 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1623053409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NN/NQnziwslkNFgyu/32WXF9fOyovwCDi+PNXgUNu+8=;
 b=DXNBwOjaAJXb/et+FP2EkmFlLJ6EWr11ds9F+xm21tjXLCntBQY0iNj4JNIv/fc3GN543+
 DBigiMyXSnUX2htWnojyJ+7F1e0RDM/WkT0cD91/aygQ61Sp3bUvXmUlWTXrXURWOR94N1
 tIpVceBRpPj0O92s2GJMynnugHh4iyY=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D1DECA3B8F;
 Mon,  7 Jun 2021 08:10:08 +0000 (UTC)
Date: Mon, 7 Jun 2021 10:10:08 +0200
To: kernel test robot <oliver.sang@intel.com>
Message-ID: <YL3UYOGIz1HoqGd1@dhcp22.suse.cz>
References: <1622560492-1294-3-git-send-email-feng.tang@intel.com>
 <20210607074815.GC16270@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607074815.GC16270@xsang-OptiPlex-9020>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [mm/mempolicy]  7463fff037: ltp.mbind01.fail
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
From: Michal Hocko via ltp <ltp@lists.linux.it>
Reply-To: Michal Hocko <mhocko@suse.com>
Cc: ying.huang@intel.com, Feng Tang <feng.tang@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>, 0day robot <lkp@intel.com>,
 lkp@lists.01.org, Randy Dunlap <rdunlap@infradead.org>,
 Dave Hansen <dave.hansen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Andi Kleen <ak@linux.intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dan Williams <dan.j.williams@intel.com>, ltp@lists.linux.it,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon 07-06-21 15:48:15, kernel test robot wrote:
> mbind01.c:169: TINFO: case MPOL_PREFERRED (no target)
> mbind01.c:188: TFAIL: Wrong policy: 1, expected: 4

AFAIU this points to
static void test_none(unsigned int i, char *p)
{
        struct test_case *tc = &tcase[i];

        TEST(mbind(p, MEM_LENGTH, tc->policy, NULL, 0, tc->flags));
}

So it calls MPOL_PREFERRED with NULL parameter and the test has failed
because the kernel returns MPOL_LOCAL instead of MPOL_PREFERRED. Strictly
speaking this is breaking user interface but I am wondering whether this
really matter or is completely unexpected.  The manual page explicitly
talks about this case
"
	If the nodemask and maxnode arguments specify the empty set, then
	the memory is allocated on the node of the CPU that triggered the
	allocation.
"

I would be inclined to keep this inconsistency and see whether anybody
actually complains and have a relevant use for this behavior. The
cleanup which makes the code easier to maintain and less error prone
doesn't really deserve to get ditched just because of this IMHO.
-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
