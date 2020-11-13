Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D7C2B1FE2
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:16:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C00313C5FC2
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:16:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 49E063C4FC1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:13:45 +0100 (CET)
Received: from smtprelay.hostedemail.com (smtprelay0148.hostedemail.com
 [216.40.44.148])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DAC9820006F
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:13:43 +0100 (CET)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 0D394837F24A;
 Fri, 13 Nov 2020 16:13:41 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2198:2199:2393:2525:2560:2563:2682:2685:2828:2859:2901:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3872:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4605:5007:6117:6119:7208:7464:7904:8784:8957:9025:9113:9121:9163:9165:9391:10004:10394:10400:10848:11026:11232:11233:11658:11876:11914:11984:12043:12050:12114:12266:12295:12296:12297:12438:12555:12740:12760:12895:12986:13069:13311:13357:13439:13870:13904:14181:14659:14721:14777:21063:21067:21080:21347:21433:21451:21611:21627:21789:30003:30029:30054:30055:30056:30064:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: owl98_140d4ca27310
X-Filterd-Recvd-Size: 2867
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Fri, 13 Nov 2020 16:13:37 +0000 (UTC)
Message-ID: <97b1b575659bc87a07a308765769451d9eee4aef.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: kernel test robot <oliver.sang@intel.com>
Date: Fri, 13 Nov 2020 08:13:36 -0800
In-Reply-To: <20201113121025.GA7578@xsang-OptiPlex-9020>
References: <20201113121025.GA7578@xsang-OptiPlex-9020>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 13 Nov 2020 17:16:10 +0100
Subject: Re: [LTP] [mm] b6efe2fcc4: BUG:kernel_NULL_pointer_dereference,
 address
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
Cc: Andrew Morton <akpm@linux-foundation.org>, lkp@lists.01.org,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, David Rientjes <rientjes@google.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 ltp@lists.linux.it, 0day robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 2020-11-13 at 20:10 +0800, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: b6efe2fcc4e11010710ef5cd8e2bcbeb221a06c6 ("mm: slub: Convert sysfs sprintf family to sysfs_emit/sysfs_emit_at")
> url: https://github.com/0day-ci/linux/commits/Joe-Perches/mm-Convert-sysfs-sprintf-family-to-sysfs_emit/20201102-041456
[] 
> on test machine: 8 threads Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz with 32G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> 
> [   41.689368] BUG: kernel NULL pointer dereference, address: 0000000000000010
> [   41.696354] #PF: supervisor read access in kernel mode
> [   41.701508] #PF: error_code(0x0000) - not-present page
> [   41.706661] PGD 0 P4D 0 
> [   41.709205] Oops: 0000 [#1] SMP PTI
> [   41.712702] CPU: 3 PID: 4619 Comm: read_all Tainted: G          I       5.10.0-rc1-00005-gb6efe2fcc4e1 #1
> [   41.722296] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.0 12/22/2016
> [   41.729714] RIP: 0010:slabs_cpu_partial_show+0x95/0xe0

Right, thanks.

I mistakenly dropped a test for page below:

@@ -5156,44 +5156,45 @@ static ssize_t slabs_cpu_partial_show(struct kmem_cache *s, char *buf)
 
                page = slub_percpu_partial(per_cpu_ptr(s->cpu_slab, cpu));
 
-               if (page && len < PAGE_SIZE - 20)
-                       len += sprintf(buf + len, " C%d=%d(%d)", cpu,
-                               page->pobjects, page->pages);
+               len += sysfs_emit_at(buf, len, " C%d=%d(%d)",
+                                    cpu, page->pobjects, page->pages);
        }

I'll correct it and resubmit.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
