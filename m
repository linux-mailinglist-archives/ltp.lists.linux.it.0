Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA5952ABF
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2024 10:41:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4F643D21B3
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2024 10:41:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F29B43D21BD
 for <ltp@lists.linux.it>; Thu, 15 Aug 2024 10:40:26 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=lists.linux.it)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C2CC21400124
 for <ltp@lists.linux.it>; Thu, 15 Aug 2024 10:40:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 71617CE0E7D;
 Thu, 15 Aug 2024 08:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE70C32786;
 Thu, 15 Aug 2024 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723711222;
 bh=4fFPEALorYBLGej2K+WrsmB97JeS+KDdUP86nNVJnos=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=cTjoMK7zL48Nwc3HtUaujSHF/Yo52Uffxq6PFPh3pv37lewBKiXKLiAWHG7BTkU8H
 3pSUD4Uk2TBTVMpaO4TU5X+NQTpydWbEAFJtgneuqJzgbbzvh4YkTBBdNg0+9HabYG
 hOyXNeQv3z0IGTYsuvANf5KEoQ735E/7/KyKsrSQ=
To: calum.mackay@oracle.com, cel@kernel.org, chuck.lever@oracle.com,
 gregkh@linuxfoundation.org, jlayton@kernel.org, josef@toxicpanda.com,
 kernel-team@fb.com, ltp@lists.linux.it, pvorel@suse.cz, sherry.yang@oracle.com
From: <gregkh@linuxfoundation.org>
Date: Thu, 15 Aug 2024 10:39:57 +0200
In-Reply-To: <20240810200009.9882-17-cel@kernel.org>
Message-ID: <2024081556-heaving-mutiny-76e3@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] Patch "nfsd: make all of the nfsd stats per-network
 namespace" has been added to the 6.1-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


This is a note to let you know that I've just added the patch titled

    nfsd: make all of the nfsd stats per-network namespace

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     nfsd-make-all-of-the-nfsd-stats-per-network-namespace.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-66337-greg=kroah.com@vger.kernel.org Sat Aug 10 22:01:28 2024
From: cel@kernel.org
Date: Sat, 10 Aug 2024 16:00:07 -0400
Subject: nfsd: make all of the nfsd stats per-network namespace
To: <stable@vger.kernel.org>
Cc: <linux-nfs@vger.kernel.org>, pvorel@suse.cz, sherry.yang@oracle.com, calum.mackay@oracle.com, kernel-team@fb.com, ltp@lists.linux.it, Josef Bacik <josef@toxicpanda.com>, Jeff Layton <jlayton@kernel.org>
Message-ID: <20240810200009.9882-17-cel@kernel.org>

From: Josef Bacik <josef@toxicpanda.com>

[ Upstream commit 4b14885411f74b2b0ce0eb2b39d0fffe54e5ca0d ]

We have a global set of counters that we modify for all of the nfsd
operations, but now that we're exposing these stats across all network
namespaces we need to make the stats also be per-network namespace.  We
already have some caching stats that are per-network namespace, so move
these definitions into the same counter and then adjust all the helpers
and users of these stats to provide the appropriate nfsd_net struct so
that the stats are maintained for the per-network namespace objects.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
[ cel: adjusted to apply to v6.1.y ]
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/nfsd/cache.h    |    2 --
 fs/nfsd/netns.h    |   17 +++++++++++++++--
 fs/nfsd/nfs4proc.c |    6 +++---
 fs/nfsd/nfscache.c |   36 +++++++-----------------------------
 fs/nfsd/nfsctl.c   |   12 +++---------
 fs/nfsd/nfsfh.c    |    3 ++-
 fs/nfsd/stats.c    |   24 +++++++++++++-----------
 fs/nfsd/stats.h    |   49 +++++++++++++++++--------------------------------
 fs/nfsd/vfs.c      |    6 ++++--
 9 files changed, 64 insertions(+), 91 deletions(-)

--- a/fs/nfsd/cache.h
+++ b/fs/nfsd/cache.h
@@ -80,8 +80,6 @@ enum {
 
 int	nfsd_drc_slab_create(void);
 void	nfsd_drc_slab_free(void);
-int	nfsd_net_reply_cache_init(struct nfsd_net *nn);
-void	nfsd_net_reply_cache_destroy(struct nfsd_net *nn);
 int	nfsd_reply_cache_init(struct nfsd_net *);
 void	nfsd_reply_cache_shutdown(struct nfsd_net *);
 int	nfsd_cache_lookup(struct svc_rqst *rqstp, unsigned int start,
--- a/fs/nfsd/netns.h
+++ b/fs/nfsd/netns.h
@@ -10,6 +10,7 @@
 
 #include <net/net_namespace.h>
 #include <net/netns/generic.h>
+#include <linux/nfs4.h>
 #include <linux/percpu_counter.h>
 #include <linux/siphash.h>
 
@@ -28,7 +29,19 @@ enum {
 	NFSD_STATS_PAYLOAD_MISSES,
 	/* amount of memory (in bytes) currently consumed by the DRC */
 	NFSD_STATS_DRC_MEM_USAGE,
-	NFSD_NET_COUNTERS_NUM
+	NFSD_STATS_RC_HITS,		/* repcache hits */
+	NFSD_STATS_RC_MISSES,		/* repcache misses */
+	NFSD_STATS_RC_NOCACHE,		/* uncached reqs */
+	NFSD_STATS_FH_STALE,		/* FH stale error */
+	NFSD_STATS_IO_READ,		/* bytes returned to read requests */
+	NFSD_STATS_IO_WRITE,		/* bytes passed in write requests */
+#ifdef CONFIG_NFSD_V4
+	NFSD_STATS_FIRST_NFS4_OP,	/* count of individual nfsv4 operations */
+	NFSD_STATS_LAST_NFS4_OP = NFSD_STATS_FIRST_NFS4_OP + LAST_NFS4_OP,
+#define NFSD_STATS_NFS4_OP(op)	(NFSD_STATS_FIRST_NFS4_OP + (op))
+	NFSD_STATS_WDELEG_GETATTR,	/* count of getattr conflict with wdeleg */
+#endif
+	NFSD_STATS_COUNTERS_NUM
 };
 
 /*
@@ -168,7 +181,7 @@ struct nfsd_net {
 	atomic_t                 num_drc_entries;
 
 	/* Per-netns stats counters */
-	struct percpu_counter    counter[NFSD_NET_COUNTERS_NUM];
+	struct percpu_counter    counter[NFSD_STATS_COUNTERS_NUM];
 
 	/* longest hash chain seen */
 	unsigned int             longest_chain;
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -2430,10 +2430,10 @@ nfsd4_proc_null(struct svc_rqst *rqstp)
 	return rpc_success;
 }
 
-static inline void nfsd4_increment_op_stats(u32 opnum)
+static inline void nfsd4_increment_op_stats(struct nfsd_net *nn, u32 opnum)
 {
 	if (opnum >= FIRST_NFS4_OP && opnum <= LAST_NFS4_OP)
-		percpu_counter_inc(&nfsdstats.counter[NFSD_STATS_NFS4_OP(opnum)]);
+		percpu_counter_inc(&nn->counter[NFSD_STATS_NFS4_OP(opnum)]);
 }
 
 static const struct nfsd4_operation nfsd4_ops[];
@@ -2708,7 +2708,7 @@ encode_op:
 					   status, nfsd4_op_name(op->opnum));
 
 		nfsd4_cstate_clear_replay(cstate);
-		nfsd4_increment_op_stats(op->opnum);
+		nfsd4_increment_op_stats(nn, op->opnum);
 	}
 
 	fh_put(current_fh);
--- a/fs/nfsd/nfscache.c
+++ b/fs/nfsd/nfscache.c
@@ -176,27 +176,6 @@ void nfsd_drc_slab_free(void)
 	kmem_cache_destroy(drc_slab);
 }
 
-/**
- * nfsd_net_reply_cache_init - per net namespace reply cache set-up
- * @nn: nfsd_net being initialized
- *
- * Returns zero on succes; otherwise a negative errno is returned.
- */
-int nfsd_net_reply_cache_init(struct nfsd_net *nn)
-{
-	return nfsd_percpu_counters_init(nn->counter, NFSD_NET_COUNTERS_NUM);
-}
-
-/**
- * nfsd_net_reply_cache_destroy - per net namespace reply cache tear-down
- * @nn: nfsd_net being freed
- *
- */
-void nfsd_net_reply_cache_destroy(struct nfsd_net *nn)
-{
-	nfsd_percpu_counters_destroy(nn->counter, NFSD_NET_COUNTERS_NUM);
-}
-
 int nfsd_reply_cache_init(struct nfsd_net *nn)
 {
 	unsigned int hashsize;
@@ -501,7 +480,7 @@ out:
 int nfsd_cache_lookup(struct svc_rqst *rqstp, unsigned int start,
 		      unsigned int len)
 {
-	struct nfsd_net		*nn;
+	struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
 	struct svc_cacherep	*rp, *found;
 	__wsum			csum;
 	struct nfsd_drc_bucket	*b;
@@ -512,7 +491,7 @@ int nfsd_cache_lookup(struct svc_rqst *r
 
 	rqstp->rq_cacherep = NULL;
 	if (type == RC_NOCACHE) {
-		nfsd_stats_rc_nocache_inc();
+		nfsd_stats_rc_nocache_inc(nn);
 		goto out;
 	}
 
@@ -522,7 +501,6 @@ int nfsd_cache_lookup(struct svc_rqst *r
 	 * Since the common case is a cache miss followed by an insert,
 	 * preallocate an entry.
 	 */
-	nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
 	rp = nfsd_cacherep_alloc(rqstp, csum, nn);
 	if (!rp)
 		goto out;
@@ -540,7 +518,7 @@ int nfsd_cache_lookup(struct svc_rqst *r
 	freed = nfsd_cacherep_dispose(&dispose);
 	trace_nfsd_drc_gc(nn, freed);
 
-	nfsd_stats_rc_misses_inc();
+	nfsd_stats_rc_misses_inc(nn);
 	atomic_inc(&nn->num_drc_entries);
 	nfsd_stats_drc_mem_usage_add(nn, sizeof(*rp));
 	goto out;
@@ -548,7 +526,7 @@ int nfsd_cache_lookup(struct svc_rqst *r
 found_entry:
 	/* We found a matching entry which is either in progress or done. */
 	nfsd_reply_cache_free_locked(NULL, rp, nn);
-	nfsd_stats_rc_hits_inc();
+	nfsd_stats_rc_hits_inc(nn);
 	rtn = RC_DROPIT;
 	rp = found;
 
@@ -698,11 +676,11 @@ int nfsd_reply_cache_stats_show(struct s
 	seq_printf(m, "mem usage:             %lld\n",
 		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_DRC_MEM_USAGE]));
 	seq_printf(m, "cache hits:            %lld\n",
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_RC_HITS]));
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_RC_HITS]));
 	seq_printf(m, "cache misses:          %lld\n",
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_RC_MISSES]));
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_RC_MISSES]));
 	seq_printf(m, "not cached:            %lld\n",
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_RC_NOCACHE]));
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_RC_NOCACHE]));
 	seq_printf(m, "payload misses:        %lld\n",
 		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_PAYLOAD_MISSES]));
 	seq_printf(m, "longest chain len:     %u\n", nn->longest_chain);
--- a/fs/nfsd/nfsctl.c
+++ b/fs/nfsd/nfsctl.c
@@ -1450,7 +1450,7 @@ static __net_init int nfsd_init_net(stru
 	retval = nfsd_idmap_init(net);
 	if (retval)
 		goto out_idmap_error;
-	retval = nfsd_net_reply_cache_init(nn);
+	retval = nfsd_stat_counters_init(nn);
 	if (retval)
 		goto out_repcache_error;
 	nn->nfsd_versions = NULL;
@@ -1475,7 +1475,7 @@ static __net_exit void nfsd_exit_net(str
 	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 
 	nfsd_proc_stat_shutdown(net);
-	nfsd_net_reply_cache_destroy(nn);
+	nfsd_stat_counters_destroy(nn);
 	nfsd_idmap_shutdown(net);
 	nfsd_export_shutdown(net);
 	nfsd_netns_free_versions(nn);
@@ -1498,12 +1498,9 @@ static int __init init_nfsd(void)
 	retval = nfsd4_init_pnfs();
 	if (retval)
 		goto out_free_slabs;
-	retval = nfsd_stat_counters_init();	/* Statistics */
-	if (retval)
-		goto out_free_pnfs;
 	retval = nfsd_drc_slab_create();
 	if (retval)
-		goto out_free_stat;
+		goto out_free_pnfs;
 	nfsd_lockd_init();	/* lockd->nfsd callbacks */
 	retval = create_proc_exports_entry();
 	if (retval)
@@ -1533,8 +1530,6 @@ out_free_exports:
 out_free_lockd:
 	nfsd_lockd_shutdown();
 	nfsd_drc_slab_free();
-out_free_stat:
-	nfsd_stat_counters_destroy();
 out_free_pnfs:
 	nfsd4_exit_pnfs();
 out_free_slabs:
@@ -1551,7 +1546,6 @@ static void __exit exit_nfsd(void)
 	nfsd_drc_slab_free();
 	remove_proc_entry("fs/nfs/exports", NULL);
 	remove_proc_entry("fs/nfs", NULL);
-	nfsd_stat_counters_destroy();
 	nfsd_lockd_shutdown();
 	nfsd4_free_slabs();
 	nfsd4_exit_pnfs();
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -327,6 +327,7 @@ out:
 __be32
 fh_verify(struct svc_rqst *rqstp, struct svc_fh *fhp, umode_t type, int access)
 {
+	struct nfsd_net *nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
 	struct svc_export *exp = NULL;
 	struct dentry	*dentry;
 	__be32		error;
@@ -395,7 +396,7 @@ skip_pseudoflavor_check:
 out:
 	trace_nfsd_fh_verify_err(rqstp, fhp, type, access, error);
 	if (error == nfserr_stale)
-		nfsd_stats_fh_stale_inc(exp);
+		nfsd_stats_fh_stale_inc(nn, exp);
 	return error;
 }
 
--- a/fs/nfsd/stats.c
+++ b/fs/nfsd/stats.c
@@ -34,15 +34,17 @@ struct svc_stat		nfsd_svcstats = {
 
 static int nfsd_show(struct seq_file *seq, void *v)
 {
+	struct net *net = pde_data(file_inode(seq->file));
+	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 	int i;
 
 	seq_printf(seq, "rc %lld %lld %lld\nfh %lld 0 0 0 0\nio %lld %lld\n",
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_RC_HITS]),
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_RC_MISSES]),
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_RC_NOCACHE]),
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_FH_STALE]),
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_IO_READ]),
-		   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_IO_WRITE]));
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_RC_HITS]),
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_RC_MISSES]),
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_RC_NOCACHE]),
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_FH_STALE]),
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_IO_READ]),
+		   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_IO_WRITE]));
 
 	/* thread usage: */
 	seq_printf(seq, "th %u 0", atomic_read(&nfsdstats.th_cnt));
@@ -63,7 +65,7 @@ static int nfsd_show(struct seq_file *se
 	seq_printf(seq,"proc4ops %u", LAST_NFS4_OP + 1);
 	for (i = 0; i <= LAST_NFS4_OP; i++) {
 		seq_printf(seq, " %lld",
-			   percpu_counter_sum_positive(&nfsdstats.counter[NFSD_STATS_NFS4_OP(i)]));
+			   percpu_counter_sum_positive(&nn->counter[NFSD_STATS_NFS4_OP(i)]));
 	}
 
 	seq_putc(seq, '\n');
@@ -106,14 +108,14 @@ void nfsd_percpu_counters_destroy(struct
 		percpu_counter_destroy(&counters[i]);
 }
 
-int nfsd_stat_counters_init(void)
+int nfsd_stat_counters_init(struct nfsd_net *nn)
 {
-	return nfsd_percpu_counters_init(nfsdstats.counter, NFSD_STATS_COUNTERS_NUM);
+	return nfsd_percpu_counters_init(nn->counter, NFSD_STATS_COUNTERS_NUM);
 }
 
-void nfsd_stat_counters_destroy(void)
+void nfsd_stat_counters_destroy(struct nfsd_net *nn)
 {
-	nfsd_percpu_counters_destroy(nfsdstats.counter, NFSD_STATS_COUNTERS_NUM);
+	nfsd_percpu_counters_destroy(nn->counter, NFSD_STATS_COUNTERS_NUM);
 }
 
 void nfsd_proc_stat_init(struct net *net)
--- a/fs/nfsd/stats.h
+++ b/fs/nfsd/stats.h
@@ -10,25 +10,7 @@
 #include <uapi/linux/nfsd/stats.h>
 #include <linux/percpu_counter.h>
 
-
-enum {
-	NFSD_STATS_RC_HITS,		/* repcache hits */
-	NFSD_STATS_RC_MISSES,		/* repcache misses */
-	NFSD_STATS_RC_NOCACHE,		/* uncached reqs */
-	NFSD_STATS_FH_STALE,		/* FH stale error */
-	NFSD_STATS_IO_READ,		/* bytes returned to read requests */
-	NFSD_STATS_IO_WRITE,		/* bytes passed in write requests */
-#ifdef CONFIG_NFSD_V4
-	NFSD_STATS_FIRST_NFS4_OP,	/* count of individual nfsv4 operations */
-	NFSD_STATS_LAST_NFS4_OP = NFSD_STATS_FIRST_NFS4_OP + LAST_NFS4_OP,
-#define NFSD_STATS_NFS4_OP(op)	(NFSD_STATS_FIRST_NFS4_OP + (op))
-#endif
-	NFSD_STATS_COUNTERS_NUM
-};
-
 struct nfsd_stats {
-	struct percpu_counter	counter[NFSD_STATS_COUNTERS_NUM];
-
 	atomic_t	th_cnt;		/* number of available threads */
 };
 
@@ -39,43 +21,46 @@ extern struct svc_stat		nfsd_svcstats;
 int nfsd_percpu_counters_init(struct percpu_counter *counters, int num);
 void nfsd_percpu_counters_reset(struct percpu_counter *counters, int num);
 void nfsd_percpu_counters_destroy(struct percpu_counter *counters, int num);
-int nfsd_stat_counters_init(void);
-void nfsd_stat_counters_destroy(void);
+int nfsd_stat_counters_init(struct nfsd_net *nn);
+void nfsd_stat_counters_destroy(struct nfsd_net *nn);
 void nfsd_proc_stat_init(struct net *net);
 void nfsd_proc_stat_shutdown(struct net *net);
 
-static inline void nfsd_stats_rc_hits_inc(void)
+static inline void nfsd_stats_rc_hits_inc(struct nfsd_net *nn)
 {
-	percpu_counter_inc(&nfsdstats.counter[NFSD_STATS_RC_HITS]);
+	percpu_counter_inc(&nn->counter[NFSD_STATS_RC_HITS]);
 }
 
-static inline void nfsd_stats_rc_misses_inc(void)
+static inline void nfsd_stats_rc_misses_inc(struct nfsd_net *nn)
 {
-	percpu_counter_inc(&nfsdstats.counter[NFSD_STATS_RC_MISSES]);
+	percpu_counter_inc(&nn->counter[NFSD_STATS_RC_MISSES]);
 }
 
-static inline void nfsd_stats_rc_nocache_inc(void)
+static inline void nfsd_stats_rc_nocache_inc(struct nfsd_net *nn)
 {
-	percpu_counter_inc(&nfsdstats.counter[NFSD_STATS_RC_NOCACHE]);
+	percpu_counter_inc(&nn->counter[NFSD_STATS_RC_NOCACHE]);
 }
 
-static inline void nfsd_stats_fh_stale_inc(struct svc_export *exp)
+static inline void nfsd_stats_fh_stale_inc(struct nfsd_net *nn,
+					   struct svc_export *exp)
 {
-	percpu_counter_inc(&nfsdstats.counter[NFSD_STATS_FH_STALE]);
+	percpu_counter_inc(&nn->counter[NFSD_STATS_FH_STALE]);
 	if (exp && exp->ex_stats)
 		percpu_counter_inc(&exp->ex_stats->counter[EXP_STATS_FH_STALE]);
 }
 
-static inline void nfsd_stats_io_read_add(struct svc_export *exp, s64 amount)
+static inline void nfsd_stats_io_read_add(struct nfsd_net *nn,
+					  struct svc_export *exp, s64 amount)
 {
-	percpu_counter_add(&nfsdstats.counter[NFSD_STATS_IO_READ], amount);
+	percpu_counter_add(&nn->counter[NFSD_STATS_IO_READ], amount);
 	if (exp && exp->ex_stats)
 		percpu_counter_add(&exp->ex_stats->counter[EXP_STATS_IO_READ], amount);
 }
 
-static inline void nfsd_stats_io_write_add(struct svc_export *exp, s64 amount)
+static inline void nfsd_stats_io_write_add(struct nfsd_net *nn,
+					   struct svc_export *exp, s64 amount)
 {
-	percpu_counter_add(&nfsdstats.counter[NFSD_STATS_IO_WRITE], amount);
+	percpu_counter_add(&nn->counter[NFSD_STATS_IO_WRITE], amount);
 	if (exp && exp->ex_stats)
 		percpu_counter_add(&exp->ex_stats->counter[EXP_STATS_IO_WRITE], amount);
 }
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -983,7 +983,9 @@ static __be32 nfsd_finish_read(struct sv
 			       unsigned long *count, u32 *eof, ssize_t host_err)
 {
 	if (host_err >= 0) {
-		nfsd_stats_io_read_add(fhp->fh_export, host_err);
+		struct nfsd_net *nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
+
+		nfsd_stats_io_read_add(nn, fhp->fh_export, host_err);
 		*eof = nfsd_eof_on_read(file, offset, host_err, *count);
 		*count = host_err;
 		fsnotify_access(file);
@@ -1126,7 +1128,7 @@ nfsd_vfs_write(struct svc_rqst *rqstp, s
 		goto out_nfserr;
 	}
 	*cnt = host_err;
-	nfsd_stats_io_write_add(exp, *cnt);
+	nfsd_stats_io_write_add(nn, exp, *cnt);
 	fsnotify_modify(file);
 	host_err = filemap_check_wb_err(file->f_mapping, since);
 	if (host_err < 0)


Patches currently in stable-queue which might be from kroah.com@vger.kernel.org are

queue-6.1/nfsd-remove-nfsd_stats-make-th_cnt-a-global-counter.patch
queue-6.1/nfsd-move-reply-cache-initialization-into-nfsd-startup.patch
queue-6.1/sunrpc-remove-pg_stats-from-svc_program.patch
queue-6.1/mptcp-pm-don-t-try-to-create-sf-if-alloc-failed.patch
queue-6.1/nfsd-rename-nfsd_reply_cache_alloc.patch
queue-6.1/nfsd-make-all-of-the-nfsd-stats-per-network-namespace.patch
queue-6.1/mptcp-pass-addr-to-mptcp_pm_alloc_anno_list.patch
queue-6.1/nfsd-move-init-of-percpu-reply_cache_stats-counters-back-to-nfsd_init_net.patch
queue-6.1/nfsd-replace-nfsd_prune_bucket.patch
queue-6.1/nfsd-stop-setting-pg_stats-for-unused-stats.patch
queue-6.1/sunrpc-don-t-change-sv_stats-if-it-doesn-t-exist.patch
queue-6.1/nfsd-make-svc_stat-per-network-namespace-instead-of-global.patch
queue-6.1/nfsd-fix-frame-size-warning-in-svc_export_parse.patch
queue-6.1/nfsd-rename-nfsd_net_-to-nfsd_stats_.patch
queue-6.1/mptcp-pm-do-not-ignore-subflow-if-signal-flag-is-also-set.patch
queue-6.1/nfsd-refactor-nfsd_reply_cache_free_locked.patch
queue-6.1/mptcp-fully-established-after-add_addr-echo-on-mpj.patch
queue-6.1/sunrpc-use-the-struct-net-as-the-svc-proc-private.patch
queue-6.1/selftests-mptcp-join-test-both-signal-subflow.patch
queue-6.1/sunrpc-pass-in-the-sv_stats-struct-through-svc_create_pooled.patch
queue-6.1/mptcp-pm-reduce-indentation-blocks.patch
queue-6.1/nfsd-rewrite-synopsis-of-nfsd_percpu_counters_init.patch
queue-6.1/nfsd-expose-proc-net-sunrpc-nfsd-in-net-namespaces.patch
queue-6.1/nfsd-refactor-the-duplicate-reply-cache-shrinker.patch

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
