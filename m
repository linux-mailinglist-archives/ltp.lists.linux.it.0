Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF56962E9
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 12:59:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92B973CC64C
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 12:59:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D0473CBF4A
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 12:59:43 +0100 (CET)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3C329600833
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 12:59:40 +0100 (CET)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 31EBxV98064172;
 Tue, 14 Feb 2023 19:59:31 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from ubuntu01 (10.0.12.75) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Tue, 14 Feb 2023 19:59:30 +0800
Date: Tue, 14 Feb 2023 11:59:15 +0000
From: Leo Liang <ycliang@andestech.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Y+t3kzdj85F8jEQu@ubuntu01>
References: <20230213134104.229241-1-ycliang@andestech.com>
 <Y+tpTaLp7cYjGDnO@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+tpTaLp7cYjGDnO@yuki>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Originating-IP: [10.0.12.75]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 31EBxV98064172
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib/tst_pid.c: Count used pid by traversing
 /proc
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On Tue, Feb 14, 2023 at 11:58:21AM +0100, Cyril Hrubis wrote:
> Hi!
> > Use "ps -eT | wc -l" to calculate the number of used pid
> > could have an incorrectly larger result because "ps -eT"
> > may list the same pid multiple times (with different SPID).
> > 
> > Instead, we could count used pid by traversing /proc
> > directory and count the subdirectories that have name
> > composed of digits.
> > 
> > Increase PIDS_RESERVED to avoid fork failure.
> 
> The changes looks good, but can we please split the patch into two?
> 
> We should keep the change to the PIDS_RESERVED separate from the code
> changes.
> 

Got it!
Will send a v3 ASAP!

Best regards,
Leo

> > Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > ---
> >  lib/tst_pid.c | 26 +++++++++++---------------
> >  1 file changed, 11 insertions(+), 15 deletions(-)
> > 
> > diff --git a/lib/tst_pid.c b/lib/tst_pid.c
> > index 5595e79bd..7582e4828 100644
> > --- a/lib/tst_pid.c
> > +++ b/lib/tst_pid.c
> > @@ -18,6 +18,7 @@
> >   *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> >   */
> >  
> > +#include <ctype.h>
> >  #include <errno.h>
> >  #include <fcntl.h>
> >  #include <limits.h>
> > @@ -35,7 +36,7 @@
> >  #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
> >  #define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
> >  /* Leave some available processes for the OS */
> > -#define PIDS_RESERVE 50
> > +#define PIDS_RESERVE 200
> >  
> >  pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
> >  {
> > @@ -113,21 +114,16 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
> >  
> >  int tst_get_free_pids_(void (*cleanup_fn) (void))
> >  {
> > -	FILE *f;
> > -	int rc, used_pids, max_pids, max_session_pids, max_threads;
> > -
> > -	f = popen("ps -eT | wc -l", "r");
> > -	if (!f) {
> > -		tst_brkm(TBROK, cleanup_fn, "Could not run 'ps' to calculate used pids");
> > -		return -1;
> > -	}
> > -	rc = fscanf(f, "%i", &used_pids);
> > -	pclose(f);
> > -
> > -	if (rc != 1 || used_pids < 0) {
> > -		tst_brkm(TBROK, cleanup_fn, "Could not read output of 'ps' to calculate used pids");
> > -		return -1;
> > +	DIR *f;
> > +	struct dirent *ent;
> > +	int max_pids, max_session_pids, max_threads, used_pids = 0;
> > +
> > +	f = SAFE_OPENDIR("/proc");
> > +	while ((ent = SAFE_READDIR(f))) {
> > +		if (isdigit(ent->d_name[0]))
> > +			++used_pids;
> >  	}
> > +	SAFE_CLOSEDIR(f);
> >  
> >  	SAFE_FILE_SCANF(cleanup_fn, PID_MAX_PATH, "%d", &max_pids);
> >  	SAFE_FILE_SCANF(cleanup_fn, THREADS_MAX_PATH, "%d", &max_threads);
> > -- 
> > 2.34.1
> > 
> > 
> > -- 
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
