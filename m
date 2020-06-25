Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB5209FC5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 15:25:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CEA23C58AB
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 15:25:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6EE2C3C2B82
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 15:25:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F2F9D20021D
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 15:25:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0932CAE56;
 Thu, 25 Jun 2020 13:25:16 +0000 (UTC)
Date: Thu, 25 Jun 2020 15:25:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200625132537.GB28350@yuki.lan>
References: <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
 <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 2/2] syscalls/clock_gettime: Add test to check
 bug during successive readings
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +typedef int (*gettime_t)(clockid_t clk_id, void *ts);
> +static gettime_t ptr_vdso_gettime, ptr_vdso_gettime64;
> +
> +static inline int _vdso_gettime(gettime_t vdso, clockid_t clk_id, void *ts)
> +{
> +	if (!vdso) {
> +		errno = ENOSYS;
> +		return -1;
> +	}
> +
> +	return vdso(clk_id, ts);
> +}
> +
> +static inline int vdso_gettime(clockid_t clk_id, void *ts)
> +{
> +	return _vdso_gettime(ptr_vdso_gettime, clk_id, ts);
> +}
> +
> +static inline int vdso_gettime64(clockid_t clk_id, void *ts)
> +{
> +	return _vdso_gettime(ptr_vdso_gettime64, clk_id, ts);
> +}
> +
> +static void find_vdso_helpers(void)
> +{
> +	/*
> +	 * Some vDSO exports its clock_gettime() implementation with a different
> +	 * name and version from other architectures, so we need to handle it as
> +	 * a special case.
> +	 */
> +#if defined(__powerpc__) || defined(__powerpc64__)
> +	const char *version = "LINUX_2.6.15";
> +	const char *name = "__kernel_clock_gettime";
> +#elif defined(__aarch64__)
> +	const char *version = "LINUX_2.6.39";
> +	const char *name = "__kernel_clock_gettime";
> +#elif defined(__s390__)
> +	const char *version = "LINUX_2.6.29";
> +	const char *name = "__kernel_clock_gettime";
> +#elif defined(__nds32__)
> +	const char *version = "LINUX_4";
> +	const char *name = "__vdso_clock_gettime";
> +#elif defined(__riscv)
> +	const char *version = "LINUX_4.15";
> +	const char *name = "__vdso_clock_gettime";
> +#else
> +	const char *version = "LINUX_2.6";
> +	const char *name = "__vdso_clock_gettime";
> +#endif
> +
> +	const char *version64 = "LINUX_2.6";
> +	const char *name64 = "__vdso_clock_gettime64";
> +
> +	unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
> +
> +	if (!sysinfo_ehdr) {
> +		tst_res(TINFO, "Couldn't find AT_SYSINFO_EHDR");
> +		return;
> +	}
> +
> +	vdso_init_from_sysinfo_ehdr(sysinfo_ehdr);
> +
> +	ptr_vdso_gettime = vdso_sym(version, name);
> +	if (!ptr_vdso_gettime)
> +		tst_res(TINFO, "Couldn't find vdso_gettime()");
> +
> +	ptr_vdso_gettime64 = vdso_sym(version64, name64);
> +	if (!ptr_vdso_gettime64)
> +		tst_res(TINFO, "Couldn't find vdso_gettime64()");
> +}

Shouldn't we put this code into the vdso lib so that we can add vdso
variant to all clock_gettime() tests?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
