Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B41A7756
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:28:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D8163C2B43
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:28:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 294513C2B34
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 11:27:57 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380127.outbound.protection.outlook.com [40.107.138.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7025E1400DA0
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 11:27:56 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQhKtw/u+zWbff41NTzBul8aFRnykKEBJ9rPBNNbLNeFUYLICuZB+EW+Mdi/G5qsj2xPfYy90vJccDpCfBd1I0IQzZb2yDH6g+BKhXTPJ+2F4qmoQF6pMg9MS3cNDqcryKP/QVviEvpaPsQkol0rSp9yxqRFyGrUnSHpYeH8TquEiNWXiwZpe7IrYYCbaYhmgZRdQJekgGyw9IiCJVWwWihwoXIGP5I8ieuatrt1Fq01naccy27rxmo6dECDA0NF5RcSvTugM0wI31wl0qXRTMqtMlplMI8Wwwy8CAkNuC0WYk7EwW+ioKOoniCmY1pkfroC432w1Lxe9kxHn5SNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSCd5Oz89hT6UyUyXJcBBHj01qSmwlnC0oeDxC1yjbM=;
 b=krDnrdGbyBd5Tq6816IqaApSUrZA8VBruQdI8JkWrrX4KABmWMrRky6tGFCe0+BD3Gyn7EbJUQ+g7AYvFSCQTDFp2n2+Vyc5QR+spYkuuzMCWDY04djrUpdc5YUpocDHIFHt0UNIQUiRoBov03o2k7yAtcM8ifIzEaTwLSkK2YfAHkWVDFdKewdC+rRo4pXd2Oluhhwtt8C6pcYmT46DO0C41PTOQ1I6pzgLGXJm81mJ+YP+Xr/a3GuPbcF2YiVh/qfbyhl3pR1e9FEwoyzxKM3fGMPteDdjRH892wMV8Q4FKmA3SVaibt4Uv5Y8vJliHERsENdf+fDSs2cStAWW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSCd5Oz89hT6UyUyXJcBBHj01qSmwlnC0oeDxC1yjbM=;
 b=Tl7RHwx4SlLclgPDtLEJxfpYuaxFmOxq3tjQUbCsoVHDxbibPeyl4K9E4LhNRovTmZtbtZlRpCCTu+6Vl02Lx3A8nnuqL+OwFTzwt2s7sB46TWjoIWkOurCZDhy65EA3sl0wHgdPJtTiCvbwvplyBAsikhBMaAy6L0VOVOe06EY=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1324.INDPRD01.PROD.OUTLOOK.COM (52.134.133.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.17; Tue, 14 Apr 2020 09:27:52 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2900.028; Tue, 14 Apr
 2020 09:27:52 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: zram01,zram02,zram03 testcase failure
Thread-Index: AQHWDCNKD1/WFIkysECeALF+2bylj6h4ZYCn
Date: Tue, 14 Apr 2020 09:27:52 +0000
Message-ID: <MAXPR0101MB14689911C0B2C71F7D01C17AEEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1468857B20832FCFDB53C877EEC20@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR0101MB1468857B20832FCFDB53C877EEC20@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [2409:4042:200e:c2db:6d47:2e6f:2aba:34b8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49ecf235-6ab1-49ff-e822-08d7e0561b57
x-ms-traffictypediagnostic: MAXPR0101MB1324:
x-microsoft-antispam-prvs: <MAXPR0101MB132408E2DB39C0D620B86EC5EEDA0@MAXPR0101MB1324.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(136003)(39830400003)(366004)(346002)(396003)(66556008)(8936002)(52536014)(76116006)(6916009)(5660300002)(66446008)(66946007)(86362001)(7696005)(55016002)(64756008)(2906002)(19627405001)(9686003)(71200400001)(8676002)(186003)(316002)(81156014)(33656002)(508600001)(6506007)(66476007)(473944003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qF/nuEJ6Jc0r+r0phAzZINcjQm0cCC2jvVZM+OozPB7CD9yCz7/2vYHSi8Ybg4rCPV5beL3aOi4hoIX9jN/i4lKX4uutdUs5ZnOR30fVqu3PGnQXLZOrnunhC5/KW+dQTLEKPl4M2R6Lh8vjN7z+U4D8UBMetJ/Newq2qVflGumaKeeJLja7sYXNuudIkIRAhszKVDDX5Rl37OebiIrPJzEEKzleeHWsr2u5djsiDnHTd06o55Sus4TD2MIeOJxTsrOpleMZ+7iSYzBT0KwYX7MfSv++M+Y6XnMcZHmbJ9NroZ3pUdPy5kGnlwWOZUDI0dfhnELzuFCQRJ9qR6+jJxQDFF0AhkWoi8Yqy2VPRJ3f69tXhxb6b1x8I+HNm8Xi8b3DHKOTXB3tMLhR8HWD6g2T882j7rxv6pKssRExR6m0ARHreDGqlaFxf5SFmC878P896JCrBJqMh7fjMYPZKiv6cFDjoJL3H09aIwh3ALY/TONo1nkB6QUjnZypKxe9aPrUlE6qy7Fxjl4+LP5XsZe1tEwJPRwpBklOp6rZhxZHHl97g1VypO86tBQkRWF8
x-ms-exchange-antispam-messagedata: KqMXnUqPSKMvCh+lNjvd8/z+5E5m+ySGfU0yQ2+7mr4RZo53wREo83pUAnn68sTunE9Afw2pGphFNLdP+C70Lb+C0oEX/pwo9xTdzPb3s1v4ViEjjllbtuM/mHlBBgAUDWpyyWA46FFsVRh4yXL28IYXtCt0cg999bgopSNJ2ppivL+6t+M+oEL1KUMttPAWyz15KXLe+QnAnYVX9msXFg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ecf235-6ab1-49ff-e822-08d7e0561b57
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 09:27:52.4940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qD6AKvTPv4HO5YvLEMpzBJlFKvMldEjY9i8pkf+0hRFwGmyKllHK88/rOnsAMA8YBnlu9jEfmHDk7xLqWjgJ7pqVlpwZjsWGKbJtRyChZgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1324
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] Fw: zram01,zram02,zram03 testcase failure
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
Content-Type: multipart/mixed; boundary="===============0738495590=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0738495590==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB14689911C0B2C71F7D01C17AEEDA0MAXPR0101MB1468_"

--_000_MAXPR0101MB14689911C0B2C71F7D01C17AEEDA0MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying run ltp on x86 with 5.3.0 but i am getting following errors for=
 zram01,zram02,zram3

DISTRIB_ID=3DUbuntu
DISTRIB_RELEASE=3D18.04
DISTRIB_CODENAME=3Dbionic
DISTRIB_DESCRIPTION=3D"Ubuntu 18.04.4 LTS"
NAME=3D"Ubuntu"
VERSION=3D"18.04.4 LTS (Bionic Beaver)"
ID=3Dubuntu
ID_LIKE=3Ddebian
PRETTY_NAME=3D"Ubuntu 18.04.4 LTS"
VERSION_ID=3D"18.04"
HOME_URL=3D"https://www.ubuntu.com/"
SUPPORT_URL=3D"https://help.ubuntu.com/"
BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/priva=
cy-policy"
VERSION_CODENAME=3Dbionic
UBUNTU_CODENAME=3Dbionic

uname:
Linux pankajjoshi 5.3.0-45-generic #37~18.04.1-Ubuntu SMP Fri Mar 27 15:58:=
10 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

/proc/cmdline
BOOT_IMAGE=3D/boot/vmlinuz-5.3.0-45-generic root=3DUUID=3Df56ebd1c-40eb-499=
5-a23e-afd3aa727650 ro quiet splash vt.handoff=3D1

Gnu C                  gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
Clang
Gnu make               4.1
util-linux             2.31.1
mount                  linux 2.31.1 (libmount 2.31.1: selinux, btrfs, asser=
t, debug)
modutils               24
e2fsprogs              1.44.1
PPP                    2.4.7
Linux C Library        > libc.2.27
Dynamic linker (ldd)   2.27
Procps                 3.3.12
Net-tools              2.10-alpha
iproute2               iproute2-ss180129
iputils                iputils-s20161105
Kbd                    2.0.4
Sh-utils               8.28
Modules Loaded         ntfs n_gsm caif_serial pps_ldisc slcan ppp_synctty n=
_hdlc mkiss ax25 ppp_async slip serport snd_seq_dummy binfmt_misc rfcomm bt=
rfs xor zstd_compress raid6_pq xfs libcrc32c zram ccm cmac bnep nls_iso8859=
_1 x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel joydev kvm irqb=
ypass mei_hdcp hid_multitouch intel_rapl_msr crct10dif_pclmul crc32_pclmul =
ghash_clmulni_intel dell_laptop dell_smm_hwmon aesni_intel aes_x86_64 snd_s=
oc_skl snd_soc_hdac_hda snd_hda_codec_hdmi snd_hda_ext_core snd_soc_skl_ipc=
 crypto_simd cryptd glue_helper snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acp=
i_intel_match ath10k_pci snd_soc_acpi snd_hda_codec_realtek snd_hda_codec_g=
eneric ath10k_core intel_cstate ath snd_soc_core uvcvideo ledtrig_audio int=
el_rapl_perf snd_compress ac97_bus videobuf2_vmalloc mac80211 videobuf2_mem=
ops snd_pcm_dmaengine videobuf2_v4l2 i915 videobuf2_common cfg80211 videode=
v mc btusb rtsx_usb_ms btrtl btbcm libarc4 btintel memstick drm_kms_helper =
bluetooth snd_hda_intel snd_intel_nhlt drm ecdh_generic i2c_algo_bit fb_sys=
_fops syscopyarea ecc snd_hda_codec sysfillrect input_leds serio_raw dell_w=
mi snd_hda_core sysimgblt dell_smbios dcdbas wmi_bmof dell_wmi_descriptor s=
nd_hwdep snd_pcm snd_seq_midi acpi_pad mei_me snd_seq_midi_event intel_xhci=
_usb_role_switch roles snd_rawmidi mei snd_seq idma64 mac_hid intel_hid snd=
_seq_device snd_timer snd virt_dma soundcore int3403_thermal sparse_keymap =
intel_lpss_pci intel_lpss processor_thermal_device intel_rapl_common intel_=
soc_dts_iosf int3400_thermal acpi_thermal_rel intel_pch_thermal int3402_the=
rmal int340x_thermal_zone sch_fq_codel parport_pc ppdev lp parport ip_table=
s x_tables autofs4 rtsx_usb_sdmmc hid_generic rtsx_usb usbhid i2c_hid psmou=
se r8169 ahci realtek libahci wmi hid pinctrl_sunrisepoint pinctrl_intel vi=
deo

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:       16296708     2524572     2326052      383432    11446084    1304=
7448
Swap:       2097148      123648     1973500

cpuinfo:
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               142
Model name:          Intel(R) Core(TM) i3-7020U CPU @ 2.30GHz
Stepping:            9
CPU MHz:             2300.141
CPU max MHz:         2300.0000
CPU min MHz:         400.0000
BogoMIPS:            4599.93
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            3072K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m=
ca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall n=
x pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xt=
opology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vm=
x est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe pop=
cnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch =
cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi fle=
xpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invp=
cid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves =
dtherm arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1=
d

AppArmor enabled
apparmor module is loaded.
37 profiles are loaded.
35 profiles are in enforce mode.
   /sbin/dhclient
   /snap/core/8935/usr/lib/snapd/snap-confine
   /snap/core/8935/usr/lib/snapd/snap-confine//mount-namespace-capture-help=
er
   /usr/bin/evince
   /usr/bin/evince-previewer
   /usr/bin/evince-previewer//sanitized_helper
   /usr/bin/evince-thumbnailer
   /usr/bin/evince//sanitized_helper
   /usr/bin/man
   /usr/lib/NetworkManager/nm-dhcp-client.action
   /usr/lib/NetworkManager/nm-dhcp-helper
   /usr/lib/connman/scripts/dhclient-script
   /usr/lib/cups/backend/cups-pdf
   /usr/lib/snapd/snap-confine
   /usr/lib/snapd/snap-confine//mount-namespace-capture-helper
   /usr/sbin/cups-browsed
   /usr/sbin/cupsd
   /usr/sbin/cupsd//third_party
   /usr/sbin/ippusbxd
   /usr/sbin/tcpdump
   libreoffice-senddoc
   libreoffice-soffice//gpg
   libreoffice-xpdfimport
   man_filter
   man_groff
   snap-update-ns.core
   snap-update-ns.gnome-calculator
   snap-update-ns.gnome-characters
   snap-update-ns.gnome-logs
   snap-update-ns.gnome-system-monitor
   snap.core.hook.configure
   snap.gnome-calculator.gnome-calculator
   snap.gnome-characters.gnome-characters
   snap.gnome-logs.gnome-logs
   snap.gnome-system-monitor.gnome-system-monitor
2 profiles are in complain mode.
   libreoffice-oopslash
   libreoffice-soffice
4 processes have profiles defined.
4 processes are in enforce mode.
   /sbin/dhclient (1051)
   /sbin/dhclient (1123)
   /usr/sbin/cups-browsed (9147)
   /usr/sbin/cupsd (9146)
0 processes are in complain mode.
0 processes are unconfined but have a profile defined.

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /opt/ltp/bin/ltp-pan   -e -S   -a 14168     -n 14168 -p -f /tmp=
/ltp-sSwnaYNEDL/alltests -l /opt/ltp/results/LTP_RUN_ON-2020_04_06-19h_44m_=
15s.log  -C /opt/ltp/output/LTP_RUN_ON-2020_04_06-19h_44m_15s.failed -T /op=
t/ltp/output/LTP_RUN_ON-2020_04_06-19h_44m_15s.tconf
INFO: Restricted to zram01
LOG File: /opt/ltp/results/LTP_RUN_ON-2020_04_06-19h_44m_15s.log
FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_04_06-19h_44m_15s.fail=
ed
TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_04_06-19h_44m_15s.tconf
Running tests.......
<<<test_start>>>
tag=3Dzram01 stime=3D1586182456
cmdline=3D"zram01.sh"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
zram01 1 TINFO: timeout per run is 0h 5m 0s
zram01 1 TINFO: create '4' zram device(s)
zram01 1 TPASS: test succeeded
zram01 1 TCONF: The device attribute max_comp_streams was introduced in ker=
nel 3.15 and deprecated in 4.7
zram01 2 TINFO: test that we can set compression algorithm
zram01 2 TINFO: supported algs: lzo lzo-rle lz4 lz4hc 842 zstd
sh: echo: I/O error
zram01 2 TFAIL: can't set 'lzo' to /sys/block/zram0/comp_algorithm
sh: echo: I/O error
sh: echo: I/O error
sh: echo: I/O error
sh: echo: I/O error
zram01 2 TINFO: AppArmor enabled, this may affect test results
zram01 2 TINFO: it can be disabled with TST_DISABLE_APPARMOR=3D1 (requires =
super/root)
zram01 2 TINFO: loaded AppArmor profiles: none

Summary:
passed   1
failed   1
skipped  1

Running tests.......
<<<test_start>>>
tag=3Dzram02 stime=3D1586184287
cmdline=3D"zram02.sh"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
zram02 1 TINFO: timeout per run is 0h 5m 0s
zram02 1 TINFO: create '1' zram device(s)
zram02 1 TFAIL: unexpected num of devices: 4
sh: echo: I/O error
zram02 1 TINFO: AppArmor enabled, this may affect test results
zram02 1 TINFO: it can be disabled with TST_DISABLE_APPARMOR=3D1 (requires =
super/root)
zram02 1 TINFO: loaded AppArmor profiles: none

Summary:
passed   0
failed   1
skipped  0
warnings 0
incrementing stop
<<<execution_status>>>

unning tests.......
<<<test_start>>>
tag=3Dzram03 stime=3D1586184558
cmdline=3D"zram03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
zram03      0  TINFO  :  create a zram device with 536870912 bytes in size.
zram03      1  TBROK  :  safe_file_ops.c:301: Failed to close FILE '/sys/bl=
ock/zram0/disksize' at zram03.c:87: errno=3DEBUSY(16): Device or resource b=
usy
zram03      2  TBROK  :  safe_file_ops.c:301: Remaining cases broken
incrementing stop
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D2 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20200120-31-g452c5132d

       ###############################################################

            Done executing testcases.
            LTP Version:  20200120-31-g452c5132d
       #############################################

what could the reason that all zram related tests are getting failed??


Thanks !

--_000_MAXPR0101MB14689911C0B2C71F7D01C17AEEDA0MAXPR0101MB1468_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,<br>
</div>
<div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>I am trying run ltp on x86 with 5.3.0 but i am getting following erro=
rs for zram01,zram02,zram3<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>DISTRIB_ID=3DUbuntu<br>
</span>
<div>DISTRIB_RELEASE=3D18.04<br>
</div>
<div>DISTRIB_CODENAME=3Dbionic<br>
</div>
<div>DISTRIB_DESCRIPTION=3D&quot;Ubuntu 18.04.4 LTS&quot;<br>
</div>
<div>NAME=3D&quot;Ubuntu&quot;<br>
</div>
<div>VERSION=3D&quot;18.04.4 LTS (Bionic Beaver)&quot;<br>
</div>
<div>ID=3Dubuntu<br>
</div>
<div>ID_LIKE=3Ddebian<br>
</div>
<div>PRETTY_NAME=3D&quot;Ubuntu 18.04.4 LTS&quot;<br>
</div>
<div>VERSION_ID=3D&quot;18.04&quot;<br>
</div>
<div>HOME_URL=3D&quot;https://www.ubuntu.com/&quot;<br>
</div>
<div>SUPPORT_URL=3D&quot;https://help.ubuntu.com/&quot;<br>
</div>
<div>BUG_REPORT_URL=3D&quot;https://bugs.launchpad.net/ubuntu/&quot;<br>
</div>
<div>PRIVACY_POLICY_URL=3D&quot;https://www.ubuntu.com/legal/terms-and-poli=
cies/privacy-policy&quot;<br>
</div>
<div>VERSION_CODENAME=3Dbionic<br>
</div>
<div>UBUNTU_CODENAME=3Dbionic<br>
</div>
<div><br>
</div>
<div>uname:<br>
</div>
<div>Linux pankajjoshi 5.3.0-45-generic #37~18.04.1-Ubuntu SMP Fri Mar 27 1=
5:58:10 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux<br>
</div>
<div><br>
</div>
<div>/proc/cmdline<br>
</div>
<div>BOOT_IMAGE=3D/boot/vmlinuz-5.3.0-45-generic root=3DUUID=3Df56ebd1c-40e=
b-4995-a23e-afd3aa727650 ro quiet splash vt.handoff=3D1<br>
</div>
<div><br>
</div>
<div>Gnu C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gc=
c (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0<br>
</div>
<div>Clang &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
</div>
<div>Gnu make &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.1<br>
</div>
<div>util-linux &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.31.1<br>
</div>
<div>mount &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;li=
nux 2.31.1 (libmount 2.31.1: selinux, btrfs, assert, debug)<br>
</div>
<div>modutils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 24<br>
</div>
<div>e2fsprogs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.44.1<br>
</div>
<div>PPP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;2.4.7<br>
</div>
<div>Linux C Library &nbsp; &nbsp; &nbsp; &nbsp;&gt; libc.2.27<br>
</div>
<div>Dynamic linker (ldd) &nbsp; 2.27<br>
</div>
<div>Procps &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.3.12<=
br>
</div>
<div>Net-tools &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.10-alpha<b=
r>
</div>
<div>iproute2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iproute2-ss1=
80129<br>
</div>
<div>iputils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iputils=
-s20161105<br>
</div>
<div>Kbd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;2.0.4<br>
</div>
<div>Sh-utils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8.28<br>
</div>
<div>Modules Loaded &nbsp; &nbsp; &nbsp; &nbsp; ntfs n_gsm caif_serial pps_=
ldisc slcan ppp_synctty n_hdlc mkiss ax25 ppp_async slip serport snd_seq_du=
mmy binfmt_misc rfcomm btrfs xor zstd_compress raid6_pq xfs libcrc32c zram =
ccm cmac bnep nls_iso8859_1 x86_pkg_temp_thermal intel_powerclamp
 coretemp kvm_intel joydev kvm irqbypass mei_hdcp hid_multitouch intel_rapl=
_msr crct10dif_pclmul crc32_pclmul ghash_clmulni_intel dell_laptop dell_smm=
_hwmon aesni_intel aes_x86_64 snd_soc_skl snd_soc_hdac_hda snd_hda_codec_hd=
mi snd_hda_ext_core snd_soc_skl_ipc
 crypto_simd cryptd glue_helper snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acp=
i_intel_match ath10k_pci snd_soc_acpi snd_hda_codec_realtek snd_hda_codec_g=
eneric ath10k_core intel_cstate ath snd_soc_core uvcvideo ledtrig_audio int=
el_rapl_perf snd_compress ac97_bus
 videobuf2_vmalloc mac80211 videobuf2_memops snd_pcm_dmaengine videobuf2_v4=
l2 i915 videobuf2_common cfg80211 videodev mc btusb rtsx_usb_ms btrtl btbcm=
 libarc4 btintel memstick drm_kms_helper bluetooth snd_hda_intel snd_intel_=
nhlt drm ecdh_generic i2c_algo_bit
 fb_sys_fops syscopyarea ecc snd_hda_codec sysfillrect input_leds serio_raw=
 dell_wmi snd_hda_core sysimgblt dell_smbios dcdbas wmi_bmof dell_wmi_descr=
iptor snd_hwdep snd_pcm snd_seq_midi acpi_pad mei_me snd_seq_midi_event int=
el_xhci_usb_role_switch roles snd_rawmidi
 mei snd_seq idma64 mac_hid intel_hid snd_seq_device snd_timer snd virt_dma=
 soundcore int3403_thermal sparse_keymap intel_lpss_pci intel_lpss processo=
r_thermal_device intel_rapl_common intel_soc_dts_iosf int3400_thermal acpi_=
thermal_rel intel_pch_thermal int3402_thermal
 int340x_thermal_zone sch_fq_codel parport_pc ppdev lp parport ip_tables x_=
tables autofs4 rtsx_usb_sdmmc hid_generic rtsx_usb usbhid i2c_hid psmouse r=
8169 ahci realtek libahci wmi hid pinctrl_sunrisepoint pinctrl_intel video<=
br>
</div>
<div><br>
</div>
<div>free reports:<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total &nbsp; &nbsp; &=
nbsp; &nbsp;used &nbsp; &nbsp; &nbsp; &nbsp;free &nbsp; &nbsp; &nbsp;shared=
 &nbsp;buff/cache &nbsp; available<br>
</div>
<div>Mem: &nbsp; &nbsp; &nbsp; 16296708 &nbsp; &nbsp; 2524572 &nbsp; &nbsp;=
 2326052 &nbsp; &nbsp; &nbsp;383432 &nbsp; &nbsp;11446084 &nbsp; &nbsp;1304=
7448<br>
</div>
<div>Swap: &nbsp; &nbsp; &nbsp; 2097148 &nbsp; &nbsp; &nbsp;123648 &nbsp; &=
nbsp; 1973500<br>
</div>
<div><br>
</div>
<div>cpuinfo:<br>
</div>
<div>Architecture: &nbsp; &nbsp; &nbsp; &nbsp;x86_64<br>
</div>
<div>CPU op-mode(s): &nbsp; &nbsp; &nbsp;32-bit, 64-bit<br>
</div>
<div>Byte Order: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Little Endian<br>
</div>
<div>CPU(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4<br>
</div>
<div>On-line CPU(s) list: 0-3<br>
</div>
<div>Thread(s) per core: &nbsp;2<br>
</div>
<div>Core(s) per socket: &nbsp;2<br>
</div>
<div>Socket(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1<br>
</div>
<div>NUMA node(s): &nbsp; &nbsp; &nbsp; &nbsp;1<br>
</div>
<div>Vendor ID: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; GenuineIntel<br>
</div>
<div>CPU family: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6<br>
</div>
<div>Model: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 142<br>
</div>
<div>Model name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Intel(R) Core(TM) i3-702=
0U CPU @ 2.30GHz<br>
</div>
<div>Stepping: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9<br>
</div>
<div>CPU MHz: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2300.141<br>
</div>
<div>CPU max MHz: &nbsp; &nbsp; &nbsp; &nbsp; 2300.0000<br>
</div>
<div>CPU min MHz: &nbsp; &nbsp; &nbsp; &nbsp; 400.0000<br>
</div>
<div>BogoMIPS: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4599.93<br>
</div>
<div>Virtualization: &nbsp; &nbsp; &nbsp;VT-x<br>
</div>
<div>L1d cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32K<br>
</div>
<div>L1i cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32K<br>
</div>
<div>L2 cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;256K<br>
</div>
<div>L3 cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3072K<br>
</div>
<div>NUMA node0 CPU(s): &nbsp; 0-3<br>
</div>
<div>Flags: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fpu vme de pse=
 tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi =
mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc ar=
t arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmper=
f
 pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr p=
dcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx=
 f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti s=
sbd ibrs ibpb stibp tpr_shadow vnmi
 flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms =
invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsa=
ves dtherm arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flus=
h_l1d<br>
</div>
<div><br>
</div>
<div>AppArmor enabled<br>
</div>
<div>apparmor module is loaded.<br>
</div>
<div>37 profiles are loaded.<br>
</div>
<div>35 profiles are in enforce mode.<br>
</div>
<div>&nbsp; &nbsp;/sbin/dhclient<br>
</div>
<div>&nbsp; &nbsp;/snap/core/8935/usr/lib/snapd/snap-confine<br>
</div>
<div>&nbsp; &nbsp;/snap/core/8935/usr/lib/snapd/snap-confine//mount-namespa=
ce-capture-helper<br>
</div>
<div>&nbsp; &nbsp;/usr/bin/evince<br>
</div>
<div>&nbsp; &nbsp;/usr/bin/evince-previewer<br>
</div>
<div>&nbsp; &nbsp;/usr/bin/evince-previewer//sanitized_helper<br>
</div>
<div>&nbsp; &nbsp;/usr/bin/evince-thumbnailer<br>
</div>
<div>&nbsp; &nbsp;/usr/bin/evince//sanitized_helper<br>
</div>
<div>&nbsp; &nbsp;/usr/bin/man<br>
</div>
<div>&nbsp; &nbsp;/usr/lib/NetworkManager/nm-dhcp-client.action<br>
</div>
<div>&nbsp; &nbsp;/usr/lib/NetworkManager/nm-dhcp-helper<br>
</div>
<div>&nbsp; &nbsp;/usr/lib/connman/scripts/dhclient-script<br>
</div>
<div>&nbsp; &nbsp;/usr/lib/cups/backend/cups-pdf<br>
</div>
<div>&nbsp; &nbsp;/usr/lib/snapd/snap-confine<br>
</div>
<div>&nbsp; &nbsp;/usr/lib/snapd/snap-confine//mount-namespace-capture-help=
er<br>
</div>
<div>&nbsp; &nbsp;/usr/sbin/cups-browsed<br>
</div>
<div>&nbsp; &nbsp;/usr/sbin/cupsd<br>
</div>
<div>&nbsp; &nbsp;/usr/sbin/cupsd//third_party<br>
</div>
<div>&nbsp; &nbsp;/usr/sbin/ippusbxd<br>
</div>
<div>&nbsp; &nbsp;/usr/sbin/tcpdump<br>
</div>
<div>&nbsp; &nbsp;libreoffice-senddoc<br>
</div>
<div>&nbsp; &nbsp;libreoffice-soffice//gpg<br>
</div>
<div>&nbsp; &nbsp;libreoffice-xpdfimport<br>
</div>
<div>&nbsp; &nbsp;man_filter<br>
</div>
<div>&nbsp; &nbsp;man_groff<br>
</div>
<div>&nbsp; &nbsp;snap-update-ns.core<br>
</div>
<div>&nbsp; &nbsp;snap-update-ns.gnome-calculator<br>
</div>
<div>&nbsp; &nbsp;snap-update-ns.gnome-characters<br>
</div>
<div>&nbsp; &nbsp;snap-update-ns.gnome-logs<br>
</div>
<div>&nbsp; &nbsp;snap-update-ns.gnome-system-monitor<br>
</div>
<div>&nbsp; &nbsp;snap.core.hook.configure<br>
</div>
<div>&nbsp; &nbsp;snap.gnome-calculator.gnome-calculator<br>
</div>
<div>&nbsp; &nbsp;snap.gnome-characters.gnome-characters<br>
</div>
<div>&nbsp; &nbsp;snap.gnome-logs.gnome-logs<br>
</div>
<div>&nbsp; &nbsp;snap.gnome-system-monitor.gnome-system-monitor<br>
</div>
<div>2 profiles are in complain mode.<br>
</div>
<div>&nbsp; &nbsp;libreoffice-oopslash<br>
</div>
<div>&nbsp; &nbsp;libreoffice-soffice<br>
</div>
<div>4 processes have profiles defined.<br>
</div>
<div>4 processes are in enforce mode.<br>
</div>
<div>&nbsp; &nbsp;/sbin/dhclient (1051) <br>
</div>
<div>&nbsp; &nbsp;/sbin/dhclient (1123) <br>
</div>
<div>&nbsp; &nbsp;/usr/sbin/cups-browsed (9147) <br>
</div>
<div>&nbsp; &nbsp;/usr/sbin/cupsd (9146) <br>
</div>
<div>0 processes are in complain mode.<br>
</div>
<div>0 processes are unconfined but have a profile defined.<br>
</div>
<div><br>
</div>
<div>SELinux mode: unknown<br>
</div>
<div>no big block device was specified on commandline.<br>
</div>
<div>Tests which require a big block device are disabled.<br>
</div>
<div>You can specify it with option -z<br>
</div>
<div>COMMAND: &nbsp; &nbsp;/opt/ltp/bin/ltp-pan &nbsp; -e -S &nbsp; -a 1416=
8 &nbsp; &nbsp; -n 14168 -p -f /tmp/ltp-sSwnaYNEDL/alltests -l /opt/ltp/res=
ults/LTP_RUN_ON-2020_04_06-19h_44m_15s.log &nbsp;-C /opt/ltp/output/LTP_RUN=
_ON-2020_04_06-19h_44m_15s.failed -T /opt/ltp/output/LTP_RUN_ON-2020_04_06-=
19h_44m_15s.tconf<br>
</div>
<div>INFO: Restricted to zram01<br>
</div>
<div>LOG File: /opt/ltp/results/LTP_RUN_ON-2020_04_06-19h_44m_15s.log<br>
</div>
<div>FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_04_06-19h_44m_15s=
.failed<br>
</div>
<div>TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_04_06-19h_44m_15s.=
tconf<br>
</div>
<div>Running tests.......<br>
</div>
<div>&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
</div>
<div>tag=3Dzram01 stime=3D1586182456<br>
</div>
<div><b>cmdline=3D&quot;zram01.sh&quot;<br>
</b></div>
<div><b>contacts=3D&quot;&quot;<br>
</b></div>
<div><b>analysis=3Dexit<br>
</b></div>
<div><b>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</b></div>
<div><b>zram01 1 TINFO: timeout per run is 0h 5m 0s<br>
</b></div>
<div><b>zram01 1 TINFO: create '4' zram device(s)<br>
</b></div>
<div><b>zram01 1 TPASS: test succeeded<br>
</b></div>
<div><b>zram01 1 TCONF: The device attribute max_comp_streams was introduce=
d in kernel 3.15 and deprecated in 4.7<br>
</b></div>
<div><b>zram01 2 TINFO: test that we can set compression algorithm<br>
</b></div>
<div><b>zram01 2 TINFO: supported algs: lzo lzo-rle lz4 lz4hc 842 zstd <br>
</b></div>
<div><b>sh: echo: I/O error<br>
</b></div>
<div><b>zram01 2 TFAIL: can't set 'lzo' to /sys/block/zram0/comp_algorithm<=
br>
</b></div>
<div><b>sh: echo: I/O error<br>
</b></div>
<div><b>sh: echo: I/O error<br>
</b></div>
<div><b>sh: echo: I/O error<br>
</b></div>
<div><b>sh: echo: I/O error<br>
</b></div>
<div><b>zram01 2 TINFO: AppArmor enabled, this may affect test results<br>
</b></div>
<div><b>zram01 2 TINFO: it can be disabled with TST_DISABLE_APPARMOR=3D1 (r=
equires super/root)<br>
</b></div>
<div><b>zram01 2 TINFO: loaded AppArmor profiles: none<br>
</b></div>
<div><b><br>
</b></div>
<div><b>Summary:<br>
</b></div>
<div><b>passed &nbsp; 1<br>
</b></div>
<div><b>failed &nbsp; 1<br>
</b></div>
<b><span>skipped &nbsp;1</span></b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b><span><br>
</span></b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b><span></span></b><span>Running tests.......<br>
</span>
<div>&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
</div>
<div>tag=3Dzram02 stime=3D1586184287<br>
</div>
<div>cmdline=3D&quot;zram02.sh&quot;<br>
</div>
<div>contacts=3D&quot;&quot;<br>
</div>
<div>analysis=3Dexit<br>
</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div><b>zram02 1 TINFO: timeout per run is 0h 5m 0s<br>
</b></div>
<div><b>zram02 1 TINFO: create '1' zram device(s)<br>
</b></div>
<div><b>zram02 1 TFAIL: unexpected num of devices: 4<br>
</b></div>
<div><b>sh: echo: I/O error<br>
</b></div>
<div><b>zram02 1 TINFO: AppArmor enabled, this may affect test results<br>
</b></div>
<div><b>zram02 1 TINFO: it can be disabled with TST_DISABLE_APPARMOR=3D1 (r=
equires super/root)<br>
</b></div>
<div><b>zram02 1 TINFO: loaded AppArmor profiles: none<br>
</b></div>
<div><b><br>
</b></div>
<div><b>Summary:<br>
</b></div>
<div><b>passed &nbsp; 0<br>
</b></div>
<div><b>failed &nbsp; 1<br>
</b></div>
<div><b>skipped &nbsp;0<br>
</b></div>
<div><b>warnings 0<br>
</b></div>
<div><b>incrementing stop<br>
</b></div>
<b><span>&lt;&lt;&lt;execution_status&gt;&gt;&gt;</span></b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b><span><br>
</span></b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b><span><span>unning tests.......<br>
</span>
<div>&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
</div>
<div>tag=3Dzram03 stime=3D1586184558<br>
</div>
<div>cmdline=3D&quot;zram03&quot;<br>
</div>
<div>contacts=3D&quot;&quot;<br>
</div>
<div>analysis=3Dexit<br>
</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div>zram03 &nbsp; &nbsp; &nbsp;0 &nbsp;TINFO &nbsp;: &nbsp;create a zram d=
evice with 536870912 bytes in size.<br>
</div>
<div>zram03 &nbsp; &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;safe_file_ops.c=
:301: Failed to close FILE '/sys/block/zram0/disksize' at zram03.c:87: errn=
o=3DEBUSY(16): Device or resource busy<br>
</div>
<div>zram03 &nbsp; &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;safe_file_ops.c=
:301: Remaining cases broken<br>
</div>
<div>incrementing stop<br>
</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</div>
<div>initiation_status=3D&quot;ok&quot;<br>
</div>
<div>duration=3D0 termination_type=3Dexited termination_id=3D2 corefile=3Dn=
o<br>
</div>
<div>cutime=3D0 cstime=3D0<br>
</div>
<div>&lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
</div>
<div>INFO: ltp-pan reported some tests FAIL<br>
</div>
<div>LTP Version: 20200120-31-g452c5132d<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;###########################################=
####################<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done executing testcases.<br=
>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LTP Version: &nbsp;20200120-=
31-g452c5132d<br>
</div>
<span>&nbsp; &nbsp; &nbsp; &nbsp;##########################################=
###</span></span></b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
what could the reason that all zram related tests are getting failed??</div=
>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks !<br>
</div>
</div>
</div>
</body>
</html>

--_000_MAXPR0101MB14689911C0B2C71F7D01C17AEEDA0MAXPR0101MB1468_--

--===============0738495590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0738495590==--
