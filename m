Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4C209BA0
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 10:59:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78DE23C5893
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 10:59:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 080013C136B
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 20:16:34 +0200 (CEST)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3885C14011B2
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 20:16:31 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OIGSeO069482;
 Wed, 24 Jun 2020 13:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593022588;
 bh=7uoAu7GFCtI4YN6yWnignny8huuKvqa6AuJsezPJb6M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=t78AcOEsR3Bs9vg+tmfs9Sij9QfMfw1KefOToK1C/7AMm7094XTzjneXtbWAt1u3r
 B01pY57W1tFjpL2zi5LqSa0Nb0mqORdkIegirh82V/EbT+IGDJ6mQNLTdd3nYhpSQ/
 NVc/XbKwp1EJf/E+Oc7QAlFcIJyaAOEA0b6UrUUI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OIGSLM118951;
 Wed, 24 Jun 2020 13:16:28 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 13:16:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 13:16:28 -0500
Received: from [158.218.117.90] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OIGP7v082940;
 Wed, 24 Jun 2020 13:16:27 -0500
To: Cyril Hrubis <chrubis@suse.cz>, <ltp@lists.linux.it>
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
Message-ID: <a1189d10-1539-2486-3d78-ede985d0f79e@ti.com>
Date: Wed, 24 Jun 2020 14:16:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623112827.10744-2-chrubis@suse.cz>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 25 Jun 2020 10:59:30 +0200
Subject: Re: [LTP] [PATCH 1/2] tst_test: Add support for device discovery
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
From: Carlos Hernandez via ltp <ltp@lists.linux.it>
Reply-To: Carlos Hernandez <ceh@ti.com>
Cc: automated-testing@yoctoproject.org
Content-Type: multipart/mixed; boundary="===============0076705310=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0076705310==
Content-Type: multipart/alternative;
	boundary="------------CA1AFE638D87E13B2E29A15F"
Content-Language: en-US

--------------CA1AFE638D87E13B2E29A15F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Cyril,

Thanks for looking at this problem...

I think we a need:

1) A common way to define Hardware capabilities, i.e. UART_RX and 
UART_TX in your example.

I suspect for device-driver tests, ltp would be called by a test 
automation framework. It should be the test automation framework 
responsibility to setup the equipment per the HW capabilities requested 
by the test.

So from ltp point of view, the only requirement is to advertise the 
required capabilities. Of course, this implies a common understanding of 
the capabilities' tags.


2) A way to set platform-specific values when required. Ideally the test 
logic can figure out the values to use dynamically but for some test 
cases, it is required to statically defined them based on the platform 
the test is running on.

In ltp-ddt we added this functionality as platform overrides 
http://arago-project.org/git/projects/?p=test-automation/ltp-ddt.git;a=blob;f=README-DDT;h=78b79cd3ca0f66a6ef30b5dc05737188c146a9ca;hb=HEAD#l46, 
borrowing an idea from OE/Yocto world. I think a different approach 
where these info is maintained in a separate file with an API that it is 
called by the test case logic would work. However, I think that this 
information is not lab-specific but board-specific and it should be part 
of ltp.


Regards,

Carlos


On 6/23/20 7:28 AM, Cyril Hrubis wrote:
> Device discovery
> ----------------
>
> The problem
> -----------
>
> Each lab has a different hardware capabilities and configuration. A test
> that heavily depends on a hardware needs to get this information in
> order to be able to run correctly.
>
> The solution
> ------------
>
> The test declares which devices it needs for a testing. In the uart test
> these are UART_RX and UART_TX which are two UART endpoints which are
> connected together.
>
> This information is then passed as a parameter to a device-discovery.sh
> script that prints, possibly several lines, of device listrs, which is
> then parsed by the test library and the test is executed accordingly.
>
> The data are passed to the test as a environment variables, if these are
> set prior to the test start, we do not even attempt to do a device
> discovery. If these are unset, we run the device discovery and loop the
> test around the lists we got.
>
> Why this solution?
> ------------------
>
> The device discovery is lab specific and does not belong to the test
> itself. This is an attempt to abstract the interface between the test
> and the hardware so that we can finally add device drivers tests into
> LTP.
>
> Missing pieces
> --------------
>
> There are stil a few missing pieces, but these are probably easy to fix
> as well.
>
> Device reconfiguration
> ~~~~~~~~~~~~~~~~~~~~~~
>
> I suppose that we may need to run a command so that the devices are
> reconfigured as we need them. I.e. the device-discovery.sh will have to
> output a comand that needs to be executed in order to prepare the
> physical environment e.g. relays in case of the UART.
>
> Device parameters
> ~~~~~~~~~~~~~~~~~
>
> We may as well need some extra info about the devices, e.g. is hardware
> flow connected in case of UART. So the device-discover.sh will add one
> more environment variable e.g. UART_PARS="hwflow" that could be parsed
> in the test as well.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>   device-discovery.sh |   5 +
>   include/tst_test.h  |   3 +
>   lib/tst_devices.c   | 228 ++++++++++++++++++++++++++++++++++++++++++++
>   lib/tst_devices.h   |  32 +++++++
>   lib/tst_test.c      |  60 ++++++++++--
>   5 files changed, 321 insertions(+), 7 deletions(-)
>   create mode 100755 device-discovery.sh
>   create mode 100644 lib/tst_devices.c
>   create mode 100644 lib/tst_devices.h
>
> diff --git a/device-discovery.sh b/device-discovery.sh
> new file mode 100755
> index 000000000..08460c41f
> --- /dev/null
> +++ b/device-discovery.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +if [ "$1" = "UART_RX-UART_TX" ]; then
> +	echo "UART_RX=/dev/ttyUSB0 UART_TX=/dev/ttyUSB0"
> +fi
> diff --git a/include/tst_test.h b/include/tst_test.h
> index b84f7b9dd..3c3693098 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -215,6 +215,9 @@ struct tst_test {
>   	/* NULL terminated array of needed kernel drivers */
>   	const char * const *needs_drivers;
>   
> +	/* NULL terminated array of devices */
> +	const char *const *needs_devices;
> +
>   	/*
>   	 * NULL terminated array of (/proc, /sys) files to save
>   	 * before setup and restore after cleanup
> diff --git a/lib/tst_devices.c b/lib/tst_devices.c
> new file mode 100644
> index 000000000..087e2021b
> --- /dev/null
> +++ b/lib/tst_devices.c
> @@ -0,0 +1,228 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
> + */
> +
> +/*
> + * Device discovery code.
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#include "tst_devices.h"
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +
> +struct tst_devlist {
> +	struct tst_devlist *next;
> +	unsigned int dev_cnt;
> +	char *devs[];
> +};
> +
> +static char *create_devstr(const char *const needs_devices[])
> +{
> +	unsigned int i;
> +	size_t len = 1;
> +
> +	for (i = 0; needs_devices[i]; i++)
> +		len += strlen(needs_devices[i]) + 1;
> +
> +	char *res = malloc(len);
> +
> +	if (!res) {
> +		tst_res(TWARN | TERRNO, "Malloc failed");
> +		return NULL;
> +	}
> +
> +	char *p = res;
> +
> +	for (i = 0; needs_devices[i]; i++) {
> +		strcpy(p, needs_devices[i]);
> +		p += strlen(needs_devices[i]);
> +		if (needs_devices[i+1]) {
> +			p[0] = '-';
> +			p++;
> +		}
> +	}
> +
> +	tst_res(TINFO, "Device discovery string '%s'", res);
> +
> +	return res;
> +}
> +
> +static int get_index(const char *env, const char *const needs_devices[])
> +{
> +	char *p = strdup(env);
> +	char *save;
> +	char *name = strtok_r(p, "=", &save);
> +	unsigned int i;
> +
> +	for (i = 0; needs_devices[i]; i++)
> +		if (!strcmp(needs_devices[i], name))
> +			return i;
> +
> +	return -1;
> +}
> +
> +static unsigned int count_devices(const char *const needs_devices[])
> +{
> +	unsigned int i = 0;
> +
> +	while (needs_devices[i])
> +		i++;
> +
> +	return i;
> +}
> +
> +static struct tst_devlist *new_devlist(char *devices[], unsigned int dev_cnt,
> +                                       const char *const needs_devices[])
> +{
> +	unsigned int i;
> +	int incomplete = 0;
> +
> +	for (i = 0; i < dev_cnt; i++) {
> +		if (!devices[i]) {
> +			tst_res(TWARN, "Missing env var '%s'", needs_devices[i]);
> +			incomplete = 1;
> +		}
> +	}
> +
> +	if (incomplete)
> +		goto err;
> +
> +	struct tst_devlist *new = malloc(sizeof(struct tst_devlist) + dev_cnt * sizeof(void*));
> +
> +	if (!new) {
> +		tst_res(TWARN, "Malloc failed");
> +		goto err;
> +	}
> +
> +	for (i = 0; i < dev_cnt; i++)
> +		new->devs[i] = devices[i];
> +
> +	new->dev_cnt = dev_cnt;
> +
> +	return new;
> +err:
> +	for (i = 0; needs_devices[i]; i++)
> +		free(devices[i]);
> +
> +	return NULL;
> +}
> +
> +struct tst_devlist *tst_devlist_discover(const char *const needs_devices[])
> +{
> +	const char *ltproot = getenv("LTPROOT");
> +	const char *device_discovery = getenv("DEVICE_DISCOVERY");
> +	char buf[2048];
> +	struct tst_devlist *root = NULL;
> +
> +	if (!device_discovery) {
> +		if (!ltproot) {
> +			tst_res(TCONF, "No LTPROOT nor DEVICE_DISCOVERY set!");
> +			return NULL;
> +		}
> +
> +		snprintf(buf, sizeof(buf), "%s/device-discovery.sh", ltproot);
> +
> +		device_discovery = buf;
> +	}
> +
> +	char *devstr = create_devstr(needs_devices);
> +
> +	if (!devstr)
> +		return NULL;
> +
> +	char *cmdline = malloc(strlen(buf) + strlen(devstr) + 3);
> +
> +	if (!cmdline) {
> +		tst_res(TWARN | TERRNO, "Malloc failed");
> +		return NULL;
> +	}
> +
> +	sprintf(cmdline, "%s \"%s\"", device_discovery, devstr);
> +
> +	free(devstr);
> +
> +	FILE *pipe = popen(cmdline, "r");
> +
> +	unsigned int dev_cnt = count_devices(needs_devices);
> +	char *devices[dev_cnt];
> +	unsigned int devlist_cnt = 0;
> +
> +	memset(devices, 0, sizeof(devices));
> +
> +	while (fgets(buf, sizeof(buf), pipe)) {
> +		char *tok, *save, *str = buf;
> +
> +		while ((tok = strtok_r(str, " \n\t", &save))) {
> +			int i = get_index(tok, needs_devices);
> +
> +			if (i < 0) {
> +				tst_res(TWARN, "Invalid env var '%s'", tok);
> +				break;
> +			}
> +
> +			if (devices[i]) {
> +				tst_res(TWARN,
> +				        "Duplicated env var '%s' and '%s'",
> +				        tok, devices[i]);
> +				break;
> +			}
> +
> +			devices[i] = strdup(tok);
> +
> +			str = NULL;
> +		}
> +
> +		struct tst_devlist *list = new_devlist(devices, dev_cnt, needs_devices);
> +
> +		memset(devices, 0, sizeof(devices));
> +
> +		if (!list)
> +			continue;
> +
> +		list->next = root;
> +		root = list;
> +		devlist_cnt++;
> +	}
> +
> +	free(cmdline);
> +
> +	if (!pipe)
> +		tst_res(TWARN | TERRNO, "Failed to execute device discovery");
> +
> +	pclose(pipe);
> +
> +	tst_res(TINFO, "Loaded %i device list(s)", devlist_cnt);
> +
> +	return root;
> +}
> +
> +unsigned int tst_devlist_cnt(struct tst_devlist *self)
> +{
> +	struct tst_devlist *i;
> +	unsigned int cnt = 0;
> +
> +	for (i = self; i; i = i->next)
> +		cnt++;
> +
> +	return cnt;
> +}
> +
> +void tst_devlist_setup(struct tst_devlist *self, unsigned int i)
> +{
> +	struct tst_devlist *l;
> +	unsigned int j, cnt = 0;
> +
> +	for (l = self; l; l = l->next) {
> +		if (i == cnt)
> +			break;
> +		cnt++;
> +	}
> +
> +	for (j = 0; j < l->dev_cnt; j++)
> +		putenv(l->devs[j]);
> +}
> diff --git a/lib/tst_devices.h b/lib/tst_devices.h
> new file mode 100644
> index 000000000..dd0047716
> --- /dev/null
> +++ b/lib/tst_devices.h
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
> + */
> +
> +/*
> + * Device discovery code.
> + */
> +
> +#ifndef TST_DEVICES_H__
> +#define TST_DEVICES_H__
> +
> +struct tst_devlist;
> +
> +/*
> + * Attempts to run a device discovery scripts for a given needs_devices list.
> + */
> +struct tst_devlist *tst_devlist_discover(const char *const needs_devices[]);
> +
> +/*
> + * Returns the number of device configurations.
> + */
> +unsigned int tst_devlist_cnt(struct tst_devlist *self);
> +
> +/*
> + * Setups the environment for a device list with index i.
> + *
> + * Exports the device list base on the variables.
> + */
> +void tst_devlist_setup(struct tst_devlist *self, unsigned int i);
> +
> +#endif /* TST_DEVICES_H__ */
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index e93c88ba5..4ae6d7d52 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -27,6 +27,7 @@
>   #include "tst_wallclock.h"
>   #include "tst_sys_conf.h"
>   #include "tst_kconfig.h"
> +#include "tst_devices.h"
>   
>   #include "old_resource.h"
>   #include "old_device.h"
> @@ -42,6 +43,8 @@ const char *TCID __attribute__((weak));
>   
>   struct tst_test *tst_test;
>   
> +static struct tst_devlist *devlist;
> +
>   static const char *tid;
>   static int iterations = 1;
>   static float duration = -1;
> @@ -471,6 +474,22 @@ static void print_test_tags(void)
>   	printf("\n");
>   }
>   
> +static void print_test_devices(void)
> +{
> +	const char *const *devices = tst_test->needs_devices;
> +	int i;
> +
> +	if (!devices)
> +		return;
> +
> +	printf("\nNeeded devices\n--------------\n");
> +
> +	for (i = 0; devices[i]; i++)
> +		printf("%s\n", devices[i]);
> +
> +	printf("\n");
> +}
> +
>   static void check_option_collision(void)
>   {
>   	unsigned int i, j;
> @@ -550,6 +569,7 @@ static void parse_opts(int argc, char *argv[])
>   		case 'h':
>   			print_help();
>   			print_test_tags();
> +			print_test_devices();
>   			exit(0);
>   		case 'i':
>   			iterations = atoi(optarg);
> @@ -907,6 +927,24 @@ static void do_setup(int argc, char *argv[])
>   				tst_brk(TCONF, "%s driver not available", name);
>   	}
>   
> +	if (tst_test->needs_devices) {
> +		int i;
> +		const char *name;
> +		int all_set = 1;
> +
> +		for (i = 0; (name = tst_test->needs_devices[i]); i++) {
> +			if (!getenv(name))
> +				all_set = 0;
> +		}
> +
> +		if (!all_set) {
> +			devlist = tst_devlist_discover(tst_test->needs_devices);
> +
> +			if (!devlist)
> +				tst_brk(TCONF, "No devices discovered");
> +		}
> +	}
> +
>   	if (tst_test->format_device)
>   		tst_test->needs_device = 1;
>   
> @@ -1335,6 +1373,7 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
>   {
>   	int ret = 0;
>   	unsigned int test_variants = 1;
> +	unsigned int dev_list, device_lists;
>   
>   	lib_pid = getpid();
>   	tst_test = self;
> @@ -1349,14 +1388,21 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
>   	if (tst_test->test_variants)
>   		test_variants = tst_test->test_variants;
>   
> -	for (tst_variant = 0; tst_variant < test_variants; tst_variant++) {
> -		if (tst_test->all_filesystems)
> -			ret |= run_tcases_per_fs();
> -		else
> -			ret |= fork_testrun();
> +	device_lists = tst_devlist_cnt(devlist);
> +
> +	for (dev_list = 0; dev_list < device_lists; dev_list++) {
>   
> -		if (ret & ~(TCONF))
> -			goto exit;
> +		tst_devlist_setup(devlist, dev_list);
> +
> +		for (tst_variant = 0; tst_variant < test_variants; tst_variant++) {
> +			if (tst_test->all_filesystems)
> +				ret |= run_tcases_per_fs();
> +			else
> +				ret |= fork_testrun();
> +
> +			if (ret & ~(TCONF))
> +				goto exit;
> +		}
>   	}
>   
>   exit:

-- 
Carlos


--------------CA1AFE638D87E13B2E29A15F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Cyril,</p>
    <p>Thanks for looking at this problem...</p>
    <p>I think we a need:<br>
    </p>
    <p>1) A common way to define Hardware capabilities, i.e. UART_RX and
      UART_TX in your example.</p>
    <p>I suspect for device-driver tests, ltp would be called by a test
      automation framework. It should be the test automation framework
      responsibility to setup the equipment per the HW capabilities
      requested by the test.</p>
    <p>So from ltp point of view, the only requirement is to advertise
      the required capabilities. Of course, this implies a common
      understanding of the capabilities' tags.<br>
    </p>
    <p><br>
    </p>
    <p>2) A way to set platform-specific values when required. Ideally
      the test logic can figure out the values to use dynamically but
      for some test cases, it is required to statically defined them
      based on the platform the test is running on.</p>
    <p>In ltp-ddt we added this functionality as platform overrides <a
href="http://arago-project.org/git/projects/?p=test-automation/ltp-ddt.git;a=blob;f=README-DDT;h=78b79cd3ca0f66a6ef30b5dc05737188c146a9ca;hb=HEAD#l46">http://arago-project.org/git/projects/?p=test-automation/ltp-ddt.git;a=blob;f=README-DDT;h=78b79cd3ca0f66a6ef30b5dc05737188c146a9ca;hb=HEAD#l46</a>,
      borrowing an idea from OE/Yocto world. I think a different
      approach where these info is maintained in a separate file with an
      API that it is called by the test case logic would work. However,
      I think that this information is not lab-specific but
      board-specific and it should be part of ltp. <br>
    </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Carlos<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 7:28 AM, Cyril Hrubis wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200623112827.10744-2-chrubis@suse.cz">
      <pre class="moz-quote-pre" wrap="">Device discovery
----------------

The problem
-----------

Each lab has a different hardware capabilities and configuration. A test
that heavily depends on a hardware needs to get this information in
order to be able to run correctly.

The solution
------------

The test declares which devices it needs for a testing. In the uart test
these are UART_RX and UART_TX which are two UART endpoints which are
connected together.

This information is then passed as a parameter to a device-discovery.sh
script that prints, possibly several lines, of device listrs, which is
then parsed by the test library and the test is executed accordingly.

The data are passed to the test as a environment variables, if these are
set prior to the test start, we do not even attempt to do a device
discovery. If these are unset, we run the device discovery and loop the
test around the lists we got.

Why this solution?
------------------

The device discovery is lab specific and does not belong to the test
itself. This is an attempt to abstract the interface between the test
and the hardware so that we can finally add device drivers tests into
LTP.

Missing pieces
--------------

There are stil a few missing pieces, but these are probably easy to fix
as well.

Device reconfiguration
~~~~~~~~~~~~~~~~~~~~~~

I suppose that we may need to run a command so that the devices are
reconfigured as we need them. I.e. the device-discovery.sh will have to
output a comand that needs to be executed in order to prepare the
physical environment e.g. relays in case of the UART.

Device parameters
~~~~~~~~~~~~~~~~~

We may as well need some extra info about the devices, e.g. is hardware
flow connected in case of UART. So the device-discover.sh will add one
more environment variable e.g. UART_PARS="hwflow" that could be parsed
in the test as well.

Signed-off-by: Cyril Hrubis <a class="moz-txt-link-rfc2396E" href="mailto:chrubis@suse.cz">&lt;chrubis@suse.cz&gt;</a>
---
 device-discovery.sh |   5 +
 include/tst_test.h  |   3 +
 lib/tst_devices.c   | 228 ++++++++++++++++++++++++++++++++++++++++++++
 lib/tst_devices.h   |  32 +++++++
 lib/tst_test.c      |  60 ++++++++++--
 5 files changed, 321 insertions(+), 7 deletions(-)
 create mode 100755 device-discovery.sh
 create mode 100644 lib/tst_devices.c
 create mode 100644 lib/tst_devices.h

diff --git a/device-discovery.sh b/device-discovery.sh
new file mode 100755
index 000000000..08460c41f
--- /dev/null
+++ b/device-discovery.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+if [ "$1" = "UART_RX-UART_TX" ]; then
+	echo "UART_RX=/dev/ttyUSB0 UART_TX=/dev/ttyUSB0"
+fi
diff --git a/include/tst_test.h b/include/tst_test.h
index b84f7b9dd..3c3693098 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -215,6 +215,9 @@ struct tst_test {
 	/* NULL terminated array of needed kernel drivers */
 	const char * const *needs_drivers;
 
+	/* NULL terminated array of devices */
+	const char *const *needs_devices;
+
 	/*
 	 * NULL terminated array of (/proc, /sys) files to save
 	 * before setup and restore after cleanup
diff --git a/lib/tst_devices.c b/lib/tst_devices.c
new file mode 100644
index 000000000..087e2021b
--- /dev/null
+++ b/lib/tst_devices.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <a class="moz-txt-link-rfc2396E" href="mailto:chrubis@suse.cz">&lt;chrubis@suse.cz&gt;</a>
+ */
+
+/*
+ * Device discovery code.
+ */
+
+#include &lt;stdio.h&gt;
+#include &lt;stdlib.h&gt;
+
+#include "tst_devices.h"
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+struct tst_devlist {
+	struct tst_devlist *next;
+	unsigned int dev_cnt;
+	char *devs[];
+};
+
+static char *create_devstr(const char *const needs_devices[])
+{
+	unsigned int i;
+	size_t len = 1;
+
+	for (i = 0; needs_devices[i]; i++)
+		len += strlen(needs_devices[i]) + 1;
+
+	char *res = malloc(len);
+
+	if (!res) {
+		tst_res(TWARN | TERRNO, "Malloc failed");
+		return NULL;
+	}
+
+	char *p = res;
+
+	for (i = 0; needs_devices[i]; i++) {
+		strcpy(p, needs_devices[i]);
+		p += strlen(needs_devices[i]);
+		if (needs_devices[i+1]) {
+			p[0] = '-';
+			p++;
+		}
+	}
+
+	tst_res(TINFO, "Device discovery string '%s'", res);
+
+	return res;
+}
+
+static int get_index(const char *env, const char *const needs_devices[])
+{
+	char *p = strdup(env);
+	char *save;
+	char *name = strtok_r(p, "=", &amp;save);
+	unsigned int i;
+
+	for (i = 0; needs_devices[i]; i++)
+		if (!strcmp(needs_devices[i], name))
+			return i;
+
+	return -1;
+}
+
+static unsigned int count_devices(const char *const needs_devices[])
+{
+	unsigned int i = 0;
+
+	while (needs_devices[i])
+		i++;
+
+	return i;
+}
+
+static struct tst_devlist *new_devlist(char *devices[], unsigned int dev_cnt,
+                                       const char *const needs_devices[])
+{
+	unsigned int i;
+	int incomplete = 0;
+
+	for (i = 0; i &lt; dev_cnt; i++) {
+		if (!devices[i]) {
+			tst_res(TWARN, "Missing env var '%s'", needs_devices[i]);
+			incomplete = 1;
+		}
+	}
+
+	if (incomplete)
+		goto err;
+
+	struct tst_devlist *new = malloc(sizeof(struct tst_devlist) + dev_cnt * sizeof(void*));
+
+	if (!new) {
+		tst_res(TWARN, "Malloc failed");
+		goto err;
+	}
+
+	for (i = 0; i &lt; dev_cnt; i++)
+		new-&gt;devs[i] = devices[i];
+
+	new-&gt;dev_cnt = dev_cnt;
+
+	return new;
+err:
+	for (i = 0; needs_devices[i]; i++)
+		free(devices[i]);
+
+	return NULL;
+}
+
+struct tst_devlist *tst_devlist_discover(const char *const needs_devices[])
+{
+	const char *ltproot = getenv("LTPROOT");
+	const char *device_discovery = getenv("DEVICE_DISCOVERY");
+	char buf[2048];
+	struct tst_devlist *root = NULL;
+
+	if (!device_discovery) {
+		if (!ltproot) {
+			tst_res(TCONF, "No LTPROOT nor DEVICE_DISCOVERY set!");
+			return NULL;
+		}
+
+		snprintf(buf, sizeof(buf), "%s/device-discovery.sh", ltproot);
+
+		device_discovery = buf;
+	}
+
+	char *devstr = create_devstr(needs_devices);
+
+	if (!devstr)
+		return NULL;
+
+	char *cmdline = malloc(strlen(buf) + strlen(devstr) + 3);
+
+	if (!cmdline) {
+		tst_res(TWARN | TERRNO, "Malloc failed");
+		return NULL;
+	}
+
+	sprintf(cmdline, "%s \"%s\"", device_discovery, devstr);
+
+	free(devstr);
+
+	FILE *pipe = popen(cmdline, "r");
+
+	unsigned int dev_cnt = count_devices(needs_devices);
+	char *devices[dev_cnt];
+	unsigned int devlist_cnt = 0;
+
+	memset(devices, 0, sizeof(devices));
+
+	while (fgets(buf, sizeof(buf), pipe)) {
+		char *tok, *save, *str = buf;
+
+		while ((tok = strtok_r(str, " \n\t", &amp;save))) {
+			int i = get_index(tok, needs_devices);
+
+			if (i &lt; 0) {
+				tst_res(TWARN, "Invalid env var '%s'", tok);
+				break;
+			}
+
+			if (devices[i]) {
+				tst_res(TWARN,
+				        "Duplicated env var '%s' and '%s'",
+				        tok, devices[i]);
+				break;
+			}
+
+			devices[i] = strdup(tok);
+
+			str = NULL;
+		}
+
+		struct tst_devlist *list = new_devlist(devices, dev_cnt, needs_devices);
+
+		memset(devices, 0, sizeof(devices));
+
+		if (!list)
+			continue;
+
+		list-&gt;next = root;
+		root = list;
+		devlist_cnt++;
+	}
+
+	free(cmdline);
+
+	if (!pipe)
+		tst_res(TWARN | TERRNO, "Failed to execute device discovery");
+
+	pclose(pipe);
+
+	tst_res(TINFO, "Loaded %i device list(s)", devlist_cnt);
+
+	return root;
+}
+
+unsigned int tst_devlist_cnt(struct tst_devlist *self)
+{
+	struct tst_devlist *i;
+	unsigned int cnt = 0;
+
+	for (i = self; i; i = i-&gt;next)
+		cnt++;
+
+	return cnt;
+}
+
+void tst_devlist_setup(struct tst_devlist *self, unsigned int i)
+{
+	struct tst_devlist *l;
+	unsigned int j, cnt = 0;
+
+	for (l = self; l; l = l-&gt;next) {
+		if (i == cnt)
+			break;
+		cnt++;
+	}
+
+	for (j = 0; j &lt; l-&gt;dev_cnt; j++)
+		putenv(l-&gt;devs[j]);
+}
diff --git a/lib/tst_devices.h b/lib/tst_devices.h
new file mode 100644
index 000000000..dd0047716
--- /dev/null
+++ b/lib/tst_devices.h
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <a class="moz-txt-link-rfc2396E" href="mailto:chrubis@suse.cz">&lt;chrubis@suse.cz&gt;</a>
+ */
+
+/*
+ * Device discovery code.
+ */
+
+#ifndef TST_DEVICES_H__
+#define TST_DEVICES_H__
+
+struct tst_devlist;
+
+/*
+ * Attempts to run a device discovery scripts for a given needs_devices list.
+ */
+struct tst_devlist *tst_devlist_discover(const char *const needs_devices[]);
+
+/*
+ * Returns the number of device configurations.
+ */
+unsigned int tst_devlist_cnt(struct tst_devlist *self);
+
+/*
+ * Setups the environment for a device list with index i.
+ *
+ * Exports the device list base on the variables.
+ */
+void tst_devlist_setup(struct tst_devlist *self, unsigned int i);
+
+#endif /* TST_DEVICES_H__ */
diff --git a/lib/tst_test.c b/lib/tst_test.c
index e93c88ba5..4ae6d7d52 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -27,6 +27,7 @@
 #include "tst_wallclock.h"
 #include "tst_sys_conf.h"
 #include "tst_kconfig.h"
+#include "tst_devices.h"
 
 #include "old_resource.h"
 #include "old_device.h"
@@ -42,6 +43,8 @@ const char *TCID __attribute__((weak));
 
 struct tst_test *tst_test;
 
+static struct tst_devlist *devlist;
+
 static const char *tid;
 static int iterations = 1;
 static float duration = -1;
@@ -471,6 +474,22 @@ static void print_test_tags(void)
 	printf("\n");
 }
 
+static void print_test_devices(void)
+{
+	const char *const *devices = tst_test-&gt;needs_devices;
+	int i;
+
+	if (!devices)
+		return;
+
+	printf("\nNeeded devices\n--------------\n");
+
+	for (i = 0; devices[i]; i++)
+		printf("%s\n", devices[i]);
+
+	printf("\n");
+}
+
 static void check_option_collision(void)
 {
 	unsigned int i, j;
@@ -550,6 +569,7 @@ static void parse_opts(int argc, char *argv[])
 		case 'h':
 			print_help();
 			print_test_tags();
+			print_test_devices();
 			exit(0);
 		case 'i':
 			iterations = atoi(optarg);
@@ -907,6 +927,24 @@ static void do_setup(int argc, char *argv[])
 				tst_brk(TCONF, "%s driver not available", name);
 	}
 
+	if (tst_test-&gt;needs_devices) {
+		int i;
+		const char *name;
+		int all_set = 1;
+
+		for (i = 0; (name = tst_test-&gt;needs_devices[i]); i++) {
+			if (!getenv(name))
+				all_set = 0;
+		}
+
+		if (!all_set) {
+			devlist = tst_devlist_discover(tst_test-&gt;needs_devices);
+
+			if (!devlist)
+				tst_brk(TCONF, "No devices discovered");
+		}
+	}
+
 	if (tst_test-&gt;format_device)
 		tst_test-&gt;needs_device = 1;
 
@@ -1335,6 +1373,7 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 {
 	int ret = 0;
 	unsigned int test_variants = 1;
+	unsigned int dev_list, device_lists;
 
 	lib_pid = getpid();
 	tst_test = self;
@@ -1349,14 +1388,21 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 	if (tst_test-&gt;test_variants)
 		test_variants = tst_test-&gt;test_variants;
 
-	for (tst_variant = 0; tst_variant &lt; test_variants; tst_variant++) {
-		if (tst_test-&gt;all_filesystems)
-			ret |= run_tcases_per_fs();
-		else
-			ret |= fork_testrun();
+	device_lists = tst_devlist_cnt(devlist);
+
+	for (dev_list = 0; dev_list &lt; device_lists; dev_list++) {
 
-		if (ret &amp; ~(TCONF))
-			goto exit;
+		tst_devlist_setup(devlist, dev_list);
+
+		for (tst_variant = 0; tst_variant &lt; test_variants; tst_variant++) {
+			if (tst_test-&gt;all_filesystems)
+				ret |= run_tcases_per_fs();
+			else
+				ret |= fork_testrun();
+
+			if (ret &amp; ~(TCONF))
+				goto exit;
+		}
 	}
 
 exit:
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Carlos</pre>
  </body>
</html>

--------------CA1AFE638D87E13B2E29A15F--

--===============0076705310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0076705310==--
